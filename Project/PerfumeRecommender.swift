//
//  PerfumeRecommender.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct PerfumeRecommender: View {
    @State private var showDescription = false
    
    @EnvironmentObject var perfumeManager: PerfumeManager
    
    @AppStorage("userPreference") var userPreferenceIsNeed = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    Spacer()
                    dropBox()
                    Spacer()
                    emojiSlider
                }
            }
            .navigationTitle("Perfume")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showDescription = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $showDescription) {
                Description()
            }
            .fullScreenCover(isPresented: $userPreferenceIsNeed, content: {
                EnterUserPreference(userPreferenceIsNeed: $userPreferenceIsNeed)
            })
        }
    }
    
    @State private var currentWeather = ""
    @StateObject private var location = LocationManager()
    
    private var background: some View {
        ZStack {
            Color.gray.opacity(0.4)
            Rain()
        }
        .onAppear {
            Task {
                await getCurrentWeather()
            }
        }
        .onChange(of: location.locationManager.authorizationStatus) { _ in
            if location.locationManager.authorizationStatus == .authorizedWhenInUse ||
                location.locationManager.authorizationStatus == .authorizedAlways {
                Task {
                    await getCurrentWeather()
                }
            }
        }
    }
    
    private func getCurrentWeather() async {
        // get current weather from backend and change currentWeather value...
        let (latitude, longitude) = getCurrentLocation()
        print(latitude)
        print(longitude)
        // fetch current weather
//        guard let url = URL(string: "http://127.0.0.1:8000/weather?lat=\(latitude)&lon=\(longitude)") else { return }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let currentWeather = try JSONDecoder().decode(String.self, from: data)
//            print(currentWeather)
//        } catch {
//            print(error)
//        }
    }
    
    private func getCurrentLocation() -> (latitude: String, longitude: String) {
        if let latitude = location.locationManager.location?.coordinate.latitude.description,
           let longitude = location.locationManager.location?.coordinate.longitude.description {
            return (latitude, longitude)
        }
        return ("", "")
    }
    
    @State private var showPerfume = false
    
    private func dropBox() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.ultraThinMaterial)
                .frame(width: 250, height: 250)
            VStack(spacing: 30) {
                Image(systemName: "face.smiling")
                    .imageScale(.large)
                    .font(.largeTitle)
                Text("Drop your emotion")
            }
            .foregroundStyle(.white.opacity(0.8))
        }
        .overlay {
            if perfumeManager.fetchingStatus == .fetching {
                ProgressView()
                    .scaleEffect(2)
                    .tint(.white)
            }
        }
        .dropDestination(for: String.self) { items, location in
            drop(items)
        }
        .sheet(isPresented: $showPerfume) {
            RecommendedPerfume()
        }
    }
    
    private func drop(_ items: [String]) -> Bool {
        if let item = items.first {
            perfumeManager.recommendPerfumeByValue(calcValue(item, whether: "cloudy"))
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in    // 시연할때 ProgressView를 보여주기위한 코드 나중엔 제거 예정.
                showPerfume = true
            }
        }
        return true
    }
    
    private func calcValue(_ emotion: String, whether: String) -> Float {
        return 0.3
    }
    
    private let emojis = ["😀", "😄", "😐", "😢", "😭"]
    
    private var emojiSlider: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .font(.system(size: 30))
                        .draggable(emoji)
                }
            }
            .padding(.horizontal)
        }
//        .background(Color.black.opacity(0.2))
//        .clipped()
    }
}

#Preview {
    PerfumeRecommender()
        .environmentObject(PerfumeManager())
}

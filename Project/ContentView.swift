//
//  ContentView.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct ContentView: View {
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
                DescriptionView()
            }
            .fullScreenCover(isPresented: $userPreferenceIsNeed, content: {
                EnterUserPreferenceView(userPreferenceIsNeed: $userPreferenceIsNeed)
            })
        }
    }
    
    @State private var currentWeather = ""
    
    private var background: some View {
        ZStack {
            Color.gray.opacity(0.4)
            Rain()
        }
        .onAppear {
            getCurrentWeather()
        }
    }
    
    private func getCurrentWeather() {
        // get current weather from backend and change currentWeather value...
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
            PerFumeView()
        }
    }
    
    private func drop(_ items: [String]) -> Bool {
        if let item = items.first {
            perfumeManager.recommendPerfumeByValue(calcValue(item, whether: "cloudy"))
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in    // 시연할때 ProgressView를 보여주기위한 코드
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
    ContentView()
        .environmentObject(PerfumeManager())
}

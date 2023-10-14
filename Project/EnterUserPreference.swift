//
//  EnterUserPreference.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct EnterUserPreference: View {  // 이 View는 나중에 나중에 추가예정
    @Binding var userPreferenceIsNeed: Bool
    
    private let weathers = ["맑은 날", "흐린 날"]
    private let perfumes = ["시트러스 타입", "플로랄 타입", "오리엔탈 타입", "시프레 타입"]
    
    @AppStorage("preferencedWeather") var preferencedWeather = "맑은 날"
    @AppStorage("preferencedPerfume") var preferencedPerfume = "시트러스 타입"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("취향을 입력해요") {
                    HStack {
                        Text("좋아하는 날씨")
                        Picker("Choose a weather", selection: $preferencedWeather) {
                            ForEach(weathers, id: \.self) { weather in
                                Text(weather)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    Picker("좋아하는 향", selection: $preferencedPerfume) {
                        ForEach(perfumes, id: \.self) { perfume in
                            Text(perfume)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Skip") {
                        userPreferenceIsNeed = false
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        userPreferenceIsNeed = false
                    }
                }
            }
        }
    }
}

#Preview {
    EnterUserPreference(userPreferenceIsNeed: .constant(true))
}

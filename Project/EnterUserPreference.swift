//
//  EnterUserPreference.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct EnterUserPreference: View {  
    @Binding var userPreferenceIsNeed: Bool
    @Binding var preferencedAge: String
    @Binding var preferencedPerfume: String
    
    private let ages = ["미성년자", "대학생", "직장인", "중년", "노인"]
    private let perfumes = ["시트러스 타입", "플로랄 타입", "오리엔탈 타입", "시프레 타입"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("취향과 연령대를 입력해요") {
                    HStack {
                        Text("연령대")
                        Picker("Choose a ages", selection: $preferencedAge) {
                            ForEach(ages, id: \.self) { age in
                                Text(age)
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
    EnterUserPreference(userPreferenceIsNeed: .constant(true), preferencedAge: .constant("대학생"), preferencedPerfume: .constant("시트러스 타입"))
}

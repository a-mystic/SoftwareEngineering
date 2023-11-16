//
//  Description.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct Description: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("앱 정보") {
                    Text("사용자의 현재위치에서의 날씨와 사용자의 감정 및 취향을 바탕으로 사용자에게 알맞은 향수를 추천해주는 앱입니다.")
                }
                Section("사용법") {
                    Text("1. 권한설정과 추가정보입력 부분을 입력해요")
                    Text("2. 현재의 감정상태에 해당하는 이모지를 선택해요")
                    Text("3. 선택한 이모지를 드래그해서 입력해요")
                    Text("4. 자신의 현재상태에 어울리는 향수를 추천받아요")
                }
                Section {
                    
                } footer: {
                    Text("\t이 앱은 소프트웨어공학 강의를위해 만들어졌습니다.")
                }
            }
            .navigationTitle("설명서")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    Description()
}

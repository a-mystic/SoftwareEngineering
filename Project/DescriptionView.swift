//
//  DescriptionView.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct DescriptionView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Text("이 앱에 대한 사용설명...")
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
    DescriptionView()
}

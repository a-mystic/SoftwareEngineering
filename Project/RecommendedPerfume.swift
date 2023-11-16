//
//  RecommendedPerfume.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct RecommendedPerfume: View {
    @EnvironmentObject private var perfumeManager: PerfumeManager
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("향수 이미지") {
                    AsyncImage(url: URL(string: perfumeManager.manager.imageUrl)) { imagePhase in
                        if let image = imagePhase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }
                }
                Section("향수 이름") {
                    Text(perfumeManager.manager.name)
                }
                Section("향수 설명") {
                    Text(perfumeManager.manager.description)
                }
            }
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
    RecommendedPerfume()
        .environmentObject(PerfumeManager())
}

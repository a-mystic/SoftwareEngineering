//
//  PerFumeView.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

struct PerFumeView: View {
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
                                .frame(width: 300, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }
                }
                Section("향수 정보") {
                    Text(perfumeManager.manager.name)
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

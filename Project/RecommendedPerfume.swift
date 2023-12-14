//
//  RecommendedPerfume.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI
import SafariServices

struct RecommendedPerfume: View {
    @EnvironmentObject private var perfumeManager: PerfumeManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showWebsite = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
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
                    Section {
                        
                    } footer: {
                        Button {
                            showWebsite = true
                        } label: {
                            Text("향수 구매하러가기")
                                .frame(maxWidth: geometry.size.width * 0.8)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                }
                .sheet(isPresented: $showWebsite, content: {
                    SafariView(url: URL(string: "https://www.chanel.com/us/fragrance/p/120525/gabrielle-chanel-eau-de-parfum-spray/")!)
                })
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}


#Preview {
    RecommendedPerfume()
        .environmentObject(PerfumeManager())
}

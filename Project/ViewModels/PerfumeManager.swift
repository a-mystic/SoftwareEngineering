//
//  PerfumeManager.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

class PerfumeManager: ObservableObject {
    @Published private(set) var manager = Perfume(name: "", description: "", imageUrl: "")
    @Published private(set) var fetchingStatus = Fetchstatus.idle
    
    enum Fetchstatus {
        case idle
        case fetching
        case failed
    }
    
    @MainActor
    func recommendPerfumeByValue(_ value: Float, age: String, preference: String) {
        fetchingStatus = .fetching
        Task {
            let recommendedPerfume = await fetchPerfume(value)
            _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in // 시연할때 ProgressView를 보여주기위한 코드
                self.fetchingStatus = .idle
            }
            manager.makePerfume(recommendedPerfume)
        }
    }
        
    private func fetchPerfume(_ value: Float, age: String = "대학생", preference: String = "오드뚜왈렛") async -> Perfume {
        // fetch recommended perfume.
        // add error handling(server response & url)
//        guard let url = URL(string: "http://127.0.0.1:8000/?value=\(value)&age=\(age)&preference=\(preference)") else { return Perfume(name: "", description: "", imageUrl: "")}
//        do {
//            let (data, response) = try await URLSession.shared.data(from: url)
//            let recommendedPerfume = try JSONDecoder().decode(PerfumeDecoder.self, from: data)
//            print(recommendedPerfume.result)
//        } catch {
//            print(error)
//        }
        let recommendedPerfume = Perfume(
            name: "Gabrielle CHANEL - Perfume & Fragrance | CHANEL",
            description: "이 향수는....",
            imageUrl: "https://puls-img.chanel.com/1688483382665-oneplpherobannermobile1500x1600pxjpg_1600x1500.jpg"
        )
        return recommendedPerfume
//        return Perfume(name: "", description: "", imageUrl: "")
    }
    
    struct PerfumeDecoder: Codable {
        var result: Perfume
    }
}

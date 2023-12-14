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
            description: "사내 조향사 크리에이터 올리비에 폴쥬(Olivier Polge)는 이 오 드 퍼퓸을 상상의 꽃으로 만들었습니다. 4개의 생동감 넘치는 흰색 꽃 부케를 기반으로 한 빛나는 순전히 여성스러운 꽃입니다. 풍부하고 감싸는 듯한 자스민의 하트 향이 일랑일랑의 프루티 그린 노트와 함께 반짝이며, 신선하고 반짝이는 오렌지 꽃송이가 빛나면서 최상의 상태로 포착된 부드러운 그라스 튜베로즈를 엿볼 수 있습니다.",
            imageUrl: "https://puls-img.chanel.com/1688483382665-oneplpherobannermobile1500x1600pxjpg_1600x1500.jpg"
        )
        return recommendedPerfume
//        return Perfume(name: "", description: "", imageUrl: "")
    }
    
    struct PerfumeDecoder: Codable {
        var result: Perfume
    }
}

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
    func recommendPerfumeByValue(_ value: Float) {
        fetchingStatus = .fetching
        fetchPerfume(value)
        _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in // 시연할때 ProgressView를 보여주기위한 코드
            self.fetchingStatus = .idle
        })
    }
        
    private func fetchPerfume(_ value: Float) {
        // fetch recommended perfume.
        let recommendedPerfume = Perfume(
            name: "Gabrielle CHANEL - Perfume & Fragrance | CHANEL",
            description: "이 향수는....",
            imageUrl: "https://puls-img.chanel.com/1688483382665-oneplpherobannermobile1500x1600pxjpg_1600x1500.jpg"
        )
        // set manager values to fetched value
        manager.makePerfume(recommendedPerfume)
    }
}

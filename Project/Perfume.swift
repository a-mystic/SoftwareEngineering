//
//  Perfume.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import Foundation

struct Perfume: Codable {
    private(set) var name: String
    private(set) var description: String
    private(set) var imageUrl: String
    
    mutating func makePerfume(_ perfume: Perfume) {
        name = perfume.name
        description = perfume.description
        imageUrl = perfume.imageUrl
    }
}

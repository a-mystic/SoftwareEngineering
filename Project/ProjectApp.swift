//
//  ProjectApp.swift
//  Project
//
//  Created by a mystic on 10/8/23.
//

import SwiftUI

@main
struct ProjectApp: App {
    @StateObject private var perfumeManager = PerfumeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(perfumeManager)
        }
    }
}

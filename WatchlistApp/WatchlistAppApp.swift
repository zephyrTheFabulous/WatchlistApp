//
//  WatchlistAppApp.swift
//  WatchlistApp
//
//  Created by Anthony on 19/8/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: Movie.self)
        }
    }
}

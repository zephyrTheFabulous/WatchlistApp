//
//  ContentView.swift
//  WatchlistApp
//
//  Created by Anthony on 19/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var movies: [Movie]

    var body: some View {
      List {

      } //: LIST
      .overlay {
        if movies.isEmpty {
          EmptyListView()
        }
      }
    }
}

#Preview("Empty") {
    ContentView()
    .modelContainer(for: Movie.self, inMemory: true)
}

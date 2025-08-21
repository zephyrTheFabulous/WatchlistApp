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
  @State private var isSheetPresented = false

    var body: some View {
      List {

      } //: LIST
      .overlay {
        if movies.isEmpty {
          EmptyListView()
        }
      }
      .safeAreaInset(edge: .bottom, alignment: .center) {
        Button {
          isSheetPresented.toggle()
        } label: {
          ButtonImageView(symbolName: "plus.circle.fill")
        }
      }
      .sheet(isPresented: $isSheetPresented) {
        NewMovieFormView()
      }
    }
}

#Preview("Empty") {
    ContentView()
    .modelContainer(for: Movie.self, inMemory: true)
}

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
        ForEach(movies) { movie in
          HStack {
            Text(movie.title)
            Spacer()
            Text(movie.genre.name)
          } //: LIST ROW
          .swipeActions {
            Button (role: .destructive) {
              withAnimation {
                modelContext.delete(movie)
              }
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
        }
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

#Preview("Sample Data") {
  ContentView()
    .modelContainer(Movie.preview)
}

#Preview("Empty") {
    ContentView()
    .modelContainer(for: Movie.self, inMemory: true)
}

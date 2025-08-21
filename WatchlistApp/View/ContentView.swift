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
  @Query(sort: \Movie.title) private var movies: [Movie] // alphabet order
  @State private var isSheetPresented = false
  
  var body: some View {
    List {
      if !movies.isEmpty {
        Section {
          ForEach(movies) { movie in
            HStack {
              Text(movie.title)
                .font(.title)
                .fontWeight(.light)
                .padding(.vertical, 2)
              Spacer()
              Text(movie.genre.name)
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(Capsule().stroke(lineWidth: 3))
                .foregroundStyle(.tertiary)
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
        } header: {
          VStack {
            Text("Watchlist")
              .font(.largeTitle)
              .fontWeight(.black)
              .padding()
            HStack {
              Label("Title", systemImage: "movieclapper")
              Spacer()
              Label("Genre", systemImage: "tag")
            }
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

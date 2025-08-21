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
  @State private var randomMovie = "" // to hold a random movie name
  @State private var isShowingAlert = false
  
    // function to show random movie from the list if there are more than 1 movie
  private func randomMovieGenerator() {
    randomMovie = movies.randomElement()!.title
  }
  
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
      HStack {
        if movies.count >= 2 {
            // RANDOMIZE BUTTON
          Button {
            randomMovieGenerator()
            isShowingAlert = true
          } label: {
            ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
          }
          .alert(randomMovie, isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) {
              
            }
            
          }
          Spacer()
        }
          //MARK: - Add new movie
        Button {
          isSheetPresented.toggle()
        } label: {
          ButtonImageView(symbolName: "plus.circle.fill")
        }
      }
      .padding(.horizontal, 16)
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

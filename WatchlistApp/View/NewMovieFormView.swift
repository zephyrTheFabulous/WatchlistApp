  //
  //  NewMovieFormView.swift
  //  WatchlistApp
  //
  //  Created by Anthony on 21/8/25.
  //

import SwiftUI

struct NewMovieFormView: View {
  @State private var title = ""
  @State private var selectedGenre: Genre = .scifi
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss

  private func addNewMovie() {
    let newMovie = Movie(title: title, genre: selectedGenre)
    modelContext.insert(newMovie)
    title = ""
    selectedGenre = .scifi
  }

  var body: some View {
    Form {
      List {
          //MARK: - HEADER
        Text("What to Watch")
          .font(.largeTitle)
          .fontWeight(.black)
          .foregroundStyle(.purple.gradient)
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
          //MARK: - TITLE
        TextField("Movie Title", text: $title)
          .textFieldStyle(.roundedBorder)
          .font(.title2)
          .fontWeight(.light)
          //MARK: - GENRE
        Picker("Genre", selection: $selectedGenre) {
          ForEach(Genre.allCases) { genre in
            Text(genre.name)
              .tag(genre)
          }
        }
          //MARK: - SAVE BUTTON
        Button {
          addNewMovie()
          dismiss()
        } label: {
          Text("Save")
            .font(.title2)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
            .buttonBorderShape(.roundedRectangle)
        }
          //MARK: - CANCEL BUTTON
        Button {
          dismiss()
        } label: {
          Text("Close")
            .frame(maxWidth: .infinity)
        }
      } //: LIST
      .listRowSeparator(.hidden)
    }
  }
}

#Preview {
  NewMovieFormView()
}

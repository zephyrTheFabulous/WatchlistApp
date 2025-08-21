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

  var body: some View {
    Form {
      List {
          //MARK: - HEADER
        Text("What to Watch")
          .font(.largeTitle)
          .fontWeight(.black)
          .foregroundStyle(.purple)
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

          //MARK: - CANCEL BUTTON

      } //: LIST
      .listRowSeparator(.hidden)
    }
  }
}

#Preview {
  NewMovieFormView()
}

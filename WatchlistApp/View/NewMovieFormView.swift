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
  @FocusState var isFocused: Bool

    // create object from values from TextField & Picker
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
          .focused($isFocused)
          .onAppear {
            isFocused = true
          }
          //MARK: - GENRE
        Picker("Genre", selection: $selectedGenre) {
          ForEach(Genre.allCases) { genre in
            Text(genre.name)
              .tag(genre)
          }
        }
          //MARK: - SAVE BUTTON
        Button {
          // change "if"
//          if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            return
//          } else { // only if there IS text, continue to action
//            addNewMovie()
//            dismiss()
//          }
          // to "guard"
          guard !title.isEmpty || !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
          } // if TextField is not empty, addNewMovie and dismiss
          addNewMovie()
          dismiss()
        } label: {
          Text("Save")
            .font(.title2)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.extraLarge)
        .buttonBorderShape(.roundedRectangle)
        .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty )
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

  //
  //  ButtonImageView.swift
  //  WatchlistApp
  //
  //  Created by Anthony on 21/8/25.
  //

import SwiftUI

struct ButtonImageView: View {
  let symbolName: String

  var body: some View {
    Image(systemName: symbolName)
      .resizable()
      .scaledToFit()
      .foregroundStyle(.purple.gradient)
      .padding(8)
      .background(Circle().fill(.ultraThinMaterial))
      .frame(width: 80)
  }
}

#Preview {
  ButtonImageView(symbolName: "plus.circle.fill")
  //    .background(.teal)
}

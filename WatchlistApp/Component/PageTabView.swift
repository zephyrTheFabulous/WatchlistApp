//
//  PageTabView.swift
//  WatchlistApp
//
//  Created by Anthony on 20/8/25.
//

import SwiftUI

struct PageTabView: View {
  var icon: String
  var description: String

    var body: some View {
      VStack(alignment: .center, spacing: 8) {
        Image(systemName: icon)
          .imageScale(.large)
          .font(.largeTitle)
          .fontWeight(.light)
          .symbolEffect(.breathe)

        Text(description)
          .font(.title)
          .fontWeight(.light)
          .multilineTextAlignment(.center)
      }
    }
}

#Preview {
  PageTabView(
    icon: "1.circle",
    description: "Add some movies to the watchlist"
  )
  .padding()
}

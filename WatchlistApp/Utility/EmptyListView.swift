//
//  EmptyListView.swift
//  WatchlistApp
//
//  Created by Anthony on 20/8/25.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView {
          Circle()
          .fill(.purple.gradient)
          .stroke(.purple.gradient.opacity(0.15), lineWidth: 30)
          .stroke(.purple.gradient.opacity(0.15), lineWidth: 60)
          .stroke(.pink.gradient.opacity(0.15), lineWidth: 90)
          .frame(width: 180)
          .overlay {
            Image(systemName: "movieclapper")
              .resizable()
              .scaledToFit()
              .frame(width: 100)
              .foregroundStyle(Color(UIColor.secondarySystemBackground))
              .padding(.top, -6)
          }
          .padding(.bottom, 90)
        } description: {
          GroupBox {
            TabView {
              PageTabView(icon: "1.circle", description: "Add some movies to the watchlist")
                .padding(36)
              PageTabView(icon: "2.circle", description: "Choose a random film to watch")
                .padding(36)
            }
            .tabViewStyle(.page)
            .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
          }

        }
    }
}

#Preview {
    EmptyListView()
}

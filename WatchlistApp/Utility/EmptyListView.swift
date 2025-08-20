//
//  EmptyListView.swift
//  WatchlistApp
//
//  Created by Anthony on 20/8/25.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        Circle()
        .fill(.blue.gradient)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
        .frame(width: 180)
        .overlay {
          Image(systemName: "movieclapper")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .foregroundStyle(Color(UIColor.secondarySystemBackground))
            .padding(.top, -6)
        }
    }
}

#Preview {
    EmptyListView()
}

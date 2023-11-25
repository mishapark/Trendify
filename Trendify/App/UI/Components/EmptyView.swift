//
//  EmptyView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-23.
//

import SwiftUI

struct EmptyView: View {
  let title: String

  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  var body: some View {
    VStack {
      MediumTitle(title)
      Image("emptyCart")
        .renderingMode(.template)
        .resizable()
        .foregroundStyle(Colors.General.DarkTextColor)
        .scaledToFit()
        .frame(maxWidth: verticalSizeClass == .regular ? 500 : 300)
    }
  }
}

#Preview {
  EmptyView(title: "Cart is empty")
}

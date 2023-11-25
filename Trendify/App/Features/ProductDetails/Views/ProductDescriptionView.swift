//
//  ProductDescriptionView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct ProductDescriptionView: View {
  let text: String

  @State var isExpanded = false

  var body: some View {
    VStack(alignment: .trailing) {
      Text(text)
        .foregroundStyle(Colors.General.AccentColor)
        .lineLimit(isExpanded ? nil : 2)
        .font(.custom(OrbitronFonts.regular, size: Constants.Text.text))
        .padding(.bottom, 3)
      Button {
        withAnimation {
          isExpanded.toggle()
        }
      } label: {
        Text(isExpanded ? "Read less" : "Read more")
          .foregroundStyle(Colors.General.DarkTextColor)
          .font(.custom(OrbitronFonts.bold, size: Constants.Text.text))
      }
    }
  }
}

#Preview {
  ProductDescriptionView(text: """
  Super cool shoes that you will every day everywhere. Don't wait and buy these shoes.
  Super cool shoes that you will every day everywhere. Don't wait and buy these shoes
  """)
}

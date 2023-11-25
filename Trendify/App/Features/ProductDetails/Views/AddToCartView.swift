//
//  AddToCartBottomView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct AddToCartView: View {
  let price: String
  let isDisabled: Bool
  let addAction: () -> Void

  var body: some View {
    HStack(spacing: 20) {
      Subtitle(price)
        .foregroundStyle(.black)
        .padding(Constants.General.padding10)
        .overlay(
          RoundedRectangle(cornerRadius: Constants.Card.cornerRadius)
            .stroke(.black, lineWidth: 1)
        )
      Button {
        addAction()
      } label: {
        HStack {
          Image(systemName: "cart")
          Subtitle("Add to cart", color: isDisabled ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Constants.General.padding10)
        .foregroundStyle(isDisabled ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
        .background(isDisabled ? .gray : Colors.General.AccentColor)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
      }
      .disabled(isDisabled)
    }
    .padding()
  }
}

#Preview {
  AddToCartView(price: "$123", isDisabled: true) {
    print("buy")
  }
}

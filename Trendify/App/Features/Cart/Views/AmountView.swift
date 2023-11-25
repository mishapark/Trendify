//
//  AmountView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-14.
//

import SwiftUI

struct AmountView: View {
  @EnvironmentObject var cart: CartViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      HStack {
        LargeRegularText("Promo on voucher".uppercased())
        Spacer()
        CustomTextField(text: $cart.promoCode, placeholder: "Promo Code")
          .textCase(.uppercase)
          .textInputAutocapitalization(.characters)
          .frame(maxWidth: 150)
      }
      MediumTitle("Payment Amount")
      SummaryText(title: "Sub Total:", amount: cart.subTotalAmount)
      SummaryText(title: "Tax 13%:", amount: cart.taxAmount)
      SummaryText(title: "Shipping Fee:", amount: cart.shippingFee)
      if cart.isPromoCodeApplied {
        SummaryText(title: "Promo Discount:", amount: cart.promoDiscount)
      }
      Divider()
        .frame(height: 1)
        .overlay(Colors.General.DarkTextColor)
      SummaryText(title: "Total:", amount: cart.totalAmount)
    }
    .padding()
    .background(Colors.General.LightestAccentColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
  }
}

#Preview {
  AmountView()
    .environmentObject(CartViewModel())
}

struct SummaryText: View {
  let title: String
  let amount: Double

  var body: some View {
    HStack {
      Subtitle(title)
      Spacer()
      SmallTitle(String(format: "$%.2f", amount))
    }
  }
}

//
//  CreditCardView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import SwiftUI

enum CardFocusedFields {
  case cardNumber, date, cvc, cardholder
}

struct CreditCardView: View {
  @FocusState var focusedField: CardFocusedFields?

  @State var cardNumber: String = ""
  @State var date: String = ""
  @State var cvc: String = ""
  @State var cardholder: String = ""

  var body: some View {
    VStack(alignment: .leading) {
      Image("mastercard")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
        .frame(maxWidth: .infinity, alignment: .trailing)
      Image("chip")
        .resizable()
        .scaledToFit()
        .frame(width: 50)
      CustomTextField(text: $cardNumber, placeholder: "Card Number", isFocused: focusedField == .cardNumber)
        .focused($focusedField, equals: .cardNumber)

      HStack {
        CustomTextField(text: $date, placeholder: "MM/YY", isFocused: focusedField == .date)
          .focused($focusedField, equals: .date)
          .frame(maxWidth: 80)
        CustomTextField(text: $cvc, placeholder: "CVC", isFocused: focusedField == .cvc)
          .focused($focusedField, equals: .cvc)
          .frame(maxWidth: 80)
      }
      CustomTextField(text: $cardholder, placeholder: "Cardholder Name", isFocused: focusedField == .cardholder)
        .focused($focusedField, equals: .cardholder)
        .frame(maxWidth: 250)
    }
    .padding()
    .background(Colors.General.LightAccentColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
    .overlay {
      RoundedRectangle(cornerRadius: Constants.Card.cornerRadius)
        .stroke(.black, lineWidth: 1)
    }
  }
}

#Preview {
  CreditCardView()
}

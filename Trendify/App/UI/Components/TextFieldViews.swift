//
//  TextFields.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import SwiftUI

struct TextFieldViews: View {
  @State var text: String

  var body: some View {
    CustomTextField(text: $text, icon: "person")
  }
}

#Preview {
  TextFieldViews(text: "Hi")
}

struct CustomTextField: View {
  @Binding var text: String

  var placeholder: String
  var isFocused: Bool
  var padding: CGFloat
  var background: Color
  var icon: String

  init(
    text: Binding<String>,
    placeholder: String = "",
    isFocused: Bool = false,
    padding: CGFloat = CGFloat(7),
    background: Color = Colors.General.LightTextColor,
    icon: String = ""
  ) {
    _text = text
    self.placeholder = placeholder
    self.isFocused = isFocused
    self.padding = padding
    self.background = background
    self.icon = icon
  }

  var body: some View {
    HStack {
      if !icon.isEmpty {
        Image(systemName: icon)
          .padding(.leading, 15)
      }
      TextField(placeholder, text: $text)
        .font(.custom(OrbitronFonts.bold, size: Constants.Text.subtitle))
        .padding(padding)
    }
    .background(background)
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
    .overlay {
      RoundedRectangle(cornerRadius: Constants.Card.cornerRadius).stroke(Colors.General.DarkTextColor)
    }
    .overlay {
      RoundedRectangle(cornerRadius: Constants.Card.cornerRadius).stroke(isFocused ? .orange : .clear, lineWidth: 2)
    }
  }
}

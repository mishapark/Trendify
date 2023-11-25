//
//  TextViews.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct TextViews: View {
  var body: some View {
    ZStack {
      Color.blue
      VStack {
        LargeTitle("Large title")
        MediumTitle("Medium title")
        SmallTitle("SmallTitle")
        Subtitle("Subtitle")
        LargeRegularText("BigRegularText")
        RegularText("RegularText")
        RoundedRectangleText("$123.00")
      }
    }
  }
}

#Preview {
  TextViews()
}

struct LargeTitle: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.extraBold, size: Constants.Text.largeTitle))
  }
}

struct MediumTitle: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.extraBold, size: Constants.Text.mediumTitle))
  }
}

struct SmallTitle: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.extraBold, size: Constants.Text.smallTitle))
  }
}

struct Subtitle: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.bold, size: Constants.Text.subtitle))
  }
}

struct LargeRegularText: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.regular, size: Constants.Text.subtitle))
  }
}

struct RegularText: View {
  let text: String
  var color: Color

  init(_ text: String, color: Color = Colors.General.DarkTextColor) {
    self.text = text
    self.color = color
  }

  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.custom(OrbitronFonts.regular, size: Constants.Text.text))
  }
}

struct RoundedRectangleText: View {
  let text: String

  init(_ text: String) {
    self.text = text
  }

  var body: some View {
    Text(text)
      .foregroundStyle(.black)
      .padding(7)
      .font(.custom(OrbitronFonts.semiBold, size: 15))
      .background(.white)
      .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
  }
}

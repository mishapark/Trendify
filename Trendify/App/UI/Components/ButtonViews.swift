//
//  ButtonViews.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

enum Sizes {
  case small, big
}

struct ButtonViews: View {
  var body: some View {
    ZStack {
      Color.blue
      VStack {
        IconButton(icon: "heart")
        TransparentCircleButton(icon: "heart")
        ColoredCircleButton(icon: "heart.fill", color: .red)
        BlackSquareButton(icon: "cart")
        CircleIconButtonWithText(icon: "nike", text: "Hello")
        SelectedCircleIconButtonWithText(icon: "nike", text: "Hello")
        CapsuleTextButton(text: "Buy now")
        AccentTextButton(text: "Buy now", icon: "arrow.right", size: .big)
        AccentTextButton(text: "Buy now", size: .small)
        LightAccentTextButton(text: "Buy now", size: .small)
      }
    }
  }
}

#Preview {
  ButtonViews()
}

struct IconButton: View {
  let icon: String
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    Image(systemName: icon)
      .resizable()
      .frame(width: size, height: size)
  }
}

struct TransparentCircleButton: View {
  let icon: String
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    Image(systemName: icon)
      .resizable()
      .frame(width: size, height: size)
      .padding(Constants.General.padding10)
      .background(.white.opacity(0.3))
      .clipShape(Circle())
  }
}

struct ColoredCircleButton: View {
  let icon: String
  let color: Color
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    Image(systemName: icon)
      .resizable()
      .frame(width: size, height: size)
      .padding(Constants.General.padding10)
      .background(.white.opacity(0.3))
      .clipShape(Circle())
      .foregroundStyle(color)
  }
}

struct BlackSquareButton: View {
  let icon: String
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    Image(systemName: icon)
      .resizable()
      .frame(width: size, height: size)
      .foregroundStyle(.white)
      .padding(Constants.General.padding10)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
  }
}

struct CircleIconButtonWithText: View {
  let icon: String
  let text: String
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    VStack(spacing: Constants.Brands.textSpacing) {
      Image(icon)
        .resizable()
        .scaledToFill()
        .frame(width: size, height: size)
        .padding(Constants.General.padding10)
        .background(Colors.General.LightestAccentColor)
        .clipShape(Circle())
      RegularText(text)
        .foregroundStyle(.black)
    }
  }
}

struct SelectedCircleIconButtonWithText: View {
  let icon: String
  let text: String
  var size: CGFloat? = Constants.General.smallIconSize

  var body: some View {
    VStack(spacing: Constants.Brands.textSpacing) {
      Image(icon)
        .resizable()
        .renderingMode(.template)
        .foregroundStyle(.white)
        .scaledToFill()
        .frame(width: size, height: size)
        .padding(Constants.General.padding10)
        .background(Colors.General.AccentColor)
        .clipShape(Circle())
        .overlay {
          Circle()
            .stroke(lineWidth: 2)
            .foregroundStyle(.orange)
        }
      RegularText(text)
    }
  }
}

struct CapsuleTextButton: View {
  let text: String

  var body: some View {
    LargeRegularText(text, color: .white)
      .padding(Constants.Button.smallPadding)
      .background(Colors.General.AccentColor)
      .clipShape(Capsule())
  }
}

struct AccentTextButton: View {
  let text: String
  var icon: String?
  let size: Sizes
  var isDisabled: Bool?

  var body: some View {
    HStack {
      if size == .big {
        MediumTitle(text.uppercased(), color: isDisabled ?? false
          ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
      } else {
        SmallTitle(text.uppercased(), color: isDisabled ?? false
          ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
      }
      if let icon = icon {
        Spacer()
        Image(systemName: icon)
          .font(.system(size: Constants.Text.mediumTitle))
          .foregroundStyle(isDisabled ?? false
            ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
      }
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
    .padding()
    .background(isDisabled ?? false ? .gray : Colors.General.AccentColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
    .padding(.horizontal)
  }
}

struct LightAccentTextButton: View {
  let text: String
  var icon: String?
  let size: Sizes
  var isDisabled: Bool?

  var body: some View {
    HStack {
      if size == .big {
        MediumTitle(text.uppercased(), color: isDisabled ?? false ? .black : .white)
      } else {
        SmallTitle(text.uppercased(), color: isDisabled ?? false ? .black : .white)
      }
      if let icon = icon {
        Spacer()
        Image(systemName: icon)
          .font(.system(size: Constants.Text.mediumTitle))
          .foregroundStyle(isDisabled ?? false
            ? Colors.General.DarkTextColor : Colors.General.LightTextColor)
      }
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
    .padding()
    .background(isDisabled ?? false ? .gray : Colors.General.LightAccentColor)
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
    .padding(.horizontal)
  }
}

//
//  HeroCardView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

struct HeroCardView: View {
  let buttonAction: () -> Void

  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  var body: some View {
    ZStack(alignment: .top) {
      let width: CGFloat = verticalSizeClass == .regular ? UIScreen.main.bounds.width - 30 : 400
      let height: CGFloat = Constants.HeroCard.height
      let widthStep: CGFloat = 30
      let heightStep: CGFloat = 15

      // Rectangles
      ForEach(0 ..< 3, id: \.self) { index in
        Rectangle()
          .frame(width: width - CGFloat(index) * widthStep, height: height + CGFloat(index) * heightStep)
          .foregroundColor(Colors.General.LightAccentColor.opacity(1.0 - Double(index) / Double(3)))
          .cornerRadius(Constants.Card.cornerRadius)
      }

      // Content
      HStack(alignment: .center) {
        VStack(alignment: .leading) {
          SmallTitle("A look at the outfits of the month")
          Button {
            buttonAction()
          } label: {
            CapsuleTextButton(text: "Buy now")
          }
        }
        .padding(.leading)

        Spacer()

        Image("man1")
          .resizable()
          .scaledToFill()
          .frame(width: Constants.HeroCard.height, height: Constants.HeroCard.height)
      }
      .frame(width: width, height: Constants.HeroCard.height)
      .offset(y: 10)
    }
    .padding(.top, 20)
    .padding(.horizontal)
  }
}

#Preview {
  HeroCardView {
    print("buy")
  }
}

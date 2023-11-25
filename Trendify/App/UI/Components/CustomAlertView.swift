//
//  CustomAlertView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-15.
//

import SwiftUI

struct CustomAlertView: View {
  var title: String?
  var message: String?
  var primaryButtonLabel: String
  var secondaryButtonLabel: String?
  var primaryButtonAction: () -> Void
  var secondaryButtonAction: (() -> Void)?
  var tapOutside: (() -> Void)?
  var image: Image?
  var isAnimated: Bool?

  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
        .opacity(0.5)
        .onTapGesture {
          if let tapOutside = tapOutside {
            tapOutside()
          }
        }
      VStack {
        if let image = image {
          image
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
        } else if let title = title {
          MediumTitle(title)
            .multilineTextAlignment(.center)
        }
        if let message = message {
          RegularText(message)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding()
        }

        VStack {
          Button {
            isAnimated ?? false ? withAnimation {
              primaryButtonAction()
            } :
              primaryButtonAction()
          } label: {
            AccentTextButton(text: primaryButtonLabel, size: .small)
          }

          if let secondaryButtonLabel = secondaryButtonLabel, let secondaryButtonAction = secondaryButtonAction {
            Button {
              isAnimated ?? false ? withAnimation {
                secondaryButtonAction()
              } :
                secondaryButtonAction()
            } label: {
              LightAccentTextButton(text: secondaryButtonLabel, size: .small)
            }
          }
        }
      }
      .padding()
      .background(Colors.General.LightestAccentColor)
      .cornerRadius(Constants.Card.cornerRadius)
      .shadow(radius: 20)
      .padding(.horizontal)
    }
  }
}

#Preview {
  Group {
    CustomAlertView(
      title: "Error",
      message: "Error happened",
      primaryButtonLabel: "Ok",
      secondaryButtonLabel: "Cancel",
      primaryButtonAction: {
        print()
      }, secondaryButtonAction: {
        print()
      })
  }
}

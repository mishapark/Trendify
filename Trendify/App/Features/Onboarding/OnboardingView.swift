//
//  OnboardingView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-21.
//

import SwiftUI

struct OnboardingView: View {
  @State private var index = 0

  var body: some View {
    TabView(selection: $index) {
      OnboardingScreen(
        index: $index,
        isLastScreen: false,
        title: "Welcome",
        description: "Discover new sales & fashion updates everyday with Trendify",
        image: "man2"
      )
      .tag(0)
      OnboardingScreen(
        index: $index,
        isLastScreen: false,
        title: "Browse",
        description: "We connect you to your favorite online retailers and show you all the best deals in one place",
        image: "man4"
      )
      .tag(1)
      OnboardingScreen(
        index: $index,
        isLastScreen: true,
        title: "Ready, set...",
        description: "Find the perfect fit for you",
        image: "man3"
      )
      .tag(2)
    }
    .background(Colors.General.AccentColor)
    .foregroundStyle(.white)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

#Preview {
  OnboardingView()
}

struct OnboardingScreen: View {
  @AppStorage("showOnBoarding")
  var showOnBoarding = true

  @Binding var index: Int
  let isLastScreen: Bool
  let title: String
  let description: String
  let image: String

  var body: some View {
    GeometryReader { geo in
      VStack {
        HStack {
          LargeTitle("Trendify", color: .white)
            .padding(.vertical)
          Spacer()
          if !isLastScreen {
            Button {
              withAnimation {
                index = 2
              }
            } label: {
              SmallTitle("Skip", color: .white)
                .padding()
                .background(Colors.General.LightAccentColor)
                .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
            }
          }
        }
        Spacer()
        ZStack {
          Circle()
            .stroke(lineWidth: 70)
            .foregroundStyle(Colors.General.LightAccentColor)
            .frame(width: geo.size.width - 150)
            .opacity(0.5)
          Image(image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width - 100)
        }
        MediumTitle(title, color: .white)
          .padding(.vertical)
        RegularText(description, color: .white)
          .multilineTextAlignment(.center)
          .frame(maxWidth: 250)
        Spacer()

        ZStack {
          HStack {
            HStack(spacing: 10) {
              ForEach(0 ..< 3, id: \.self) { index in
                Circle()
                  .fill(index == self.index ? Color.white : .clear)
                  .overlay {
                    Circle().stroke(lineWidth: 1)
                  }
                  .frame(width: 7, height: 7)
              }
            }
            Spacer()
            if !isLastScreen {
              Button {
                withAnimation {
                  index += 1
                }
              } label: {
                Image(systemName: "arrow.right")
                  .resizable()
                  .frame(width: 30, height: 20)
                  .foregroundStyle(.white)
              }
              .foregroundStyle(.black)
            } else {
              Button {
                withAnimation {
                  showOnBoarding = false
                }
              } label: {
                RegularText("Let's go!".uppercased(), color: .black)
                  .padding()
                  .background(.white)
                  .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
              }
            }
          }
          if !isLastScreen {
            RegularText("Scroll Right", color: .white)
          }
        }
      }
      .padding(.horizontal, 30)
    }
  }
}

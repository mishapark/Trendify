//
//  LaunchAnimation.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-21.
//

import SwiftUI

struct LaunchAnimation: View {
  @Binding var showLaunchAnimation: Bool
  @State private var logoScale: CGFloat = 1

  var body: some View {
    ZStack {
      Colors.General.LaunchScreenColor

      Image("appIcon")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: logoScale, maxHeight: logoScale)
    }
    .ignoresSafeArea()
    .onAppear {
      withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) {
        logoScale = 230
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        showLaunchAnimation = false
      }
    }
  }
}

#Preview {
  LaunchAnimation(showLaunchAnimation: .constant(true))
}

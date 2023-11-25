//
//  TrendifyApp.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import SwiftUI

@main
struct TrendifyApp: App {
  @State private var showLaunchAnimation = true
  @AppStorage("showOnBoarding")
  var showOnBoarding = true

  var body: some Scene {
    WindowGroup {
      ZStack {
        ContentView()

        if showOnBoarding {
          OnboardingView()
        }

        if showLaunchAnimation {
          LaunchAnimation(showLaunchAnimation: $showLaunchAnimation)
            .transition(.move(edge: .leading))
        }
      }
    }
  }
}

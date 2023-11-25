//
//  ContentView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import SwiftUI

struct ContentView: View {
  @StateObject var settings = ContentViewModel()
  @StateObject var home = HomeViewModel()
  @StateObject var cart = CartViewModel()
  @StateObject var profile = ProfileViewModel()

  var body: some View {
    MainTabView()
      .environmentObject(settings)
      .environmentObject(home)
      .environmentObject(cart)
      .environmentObject(profile)
      .preferredColorScheme(profile.darkMode() ? .dark : .light)
  }
}

#Preview {
  ContentView()
}

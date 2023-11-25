//
//  MainTabView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject var settings: ContentViewModel

  var body: some View {
    NavigationStack(path: $settings.path) {
      ZStack(alignment: .bottom) {
        TabView(selection: $settings.currentTab) {
          HomeView()
            .toolbar(.hidden, for: .tabBar)
            .tag(Tabs.home)
            .onAppear {
              withAnimation {
                settings.isTabViewVisible = true
              }
            }
          SearchView()
            .toolbar(.hidden, for: .tabBar)
            .tag(Tabs.search)
            .onAppear {
              withAnimation {
                settings.isTabViewVisible = true
              }
            }
          CartView()
            .toolbar(.hidden, for: .tabBar)
            .tag(Tabs.cart)
            .onAppear {
              withAnimation {
                settings.isTabViewVisible = true
              }
            }
          ProfileView()
            .toolbar(.hidden, for: .tabBar)
            .tag(Tabs.profile)
            .onAppear {
              withAnimation {
                settings.isTabViewVisible = true
              }
            }
        }

        CustomTabView(currentTab: $settings.currentTab)
          .offset(y: settings.isTabViewVisible ? 0 : 200)
          .padding(.bottom, settings.hasHomeBar ? 0 : 10)
      }
      .navigationDestination(for: NavigationPaths.self) { path in
        switch path {
        case .productDetails(let product):
          ProductDetailsView(product: product)
        case .brandProducts(let id):
          BrandProductsView(categoryId: id)
        case .favorites:
          FavoritesView()
        }
      }
    }
  }
}

#Preview {
  MainTabView()
    .environmentObject(ContentViewModel())
}

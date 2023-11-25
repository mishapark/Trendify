//
//  Tabs.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-10.
//

import Foundation

enum Tabs: Int, CaseIterable {
  case home = 0
  case search
  case cart
  case profile

  var title: String {
    switch self {
    case .home:
      return "Home"
    case .search:
      return "Search"
    case .cart:
      return "Cart"
    case .profile:
      return "Profile"
    }
  }

  var iconName: String {
    switch self {
    case .home:
      return "home-icon"
    case .search:
      return "search-icon"
    case .cart:
      return "cart-icon"
    case .profile:
      return "profile-icon"
    }
  }
}

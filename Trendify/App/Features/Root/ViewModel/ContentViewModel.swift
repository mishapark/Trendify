//
//  ContentViewModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import Foundation
import UIKit

enum NavigationPaths: Hashable {
  case productDetails(Product)
  case brandProducts(Int?)
  case favorites
}

class ContentViewModel: ObservableObject {
  @Published var isTabViewVisible = true
  @Published var currentTab = Tabs.home
  @Published var path: [NavigationPaths] = []
  @Published var orientation = UIDevice.current.orientation

  var hasHomeBar: Bool {
    // swiftlint:disable:next line_length
    if #available(iOS 11.0, *), let keyWindow = UIApplication.shared.connectedScenes.flatMap({ ($0 as? UIWindowScene)?.windows ?? [] }).first(where: { $0.isKeyWindow }), keyWindow.safeAreaInsets.bottom > 0 {
      return true
    }
    return false
  }
}

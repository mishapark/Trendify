//
//  Constants.swift
//
//  Trendify
//  Created by Mikhail Pak on 2023-11-09.
//

import Foundation
import UIKit

enum Constants {
  enum General {
    // padding
    public static let padding5 = CGFloat(5)
    public static let padding10 = CGFloat(10)
    public static let pageTopPadding = HeaderView.height + 15
    public static let pageBottomPadding = TabView.height + 15

    // spacing
    public static let sectionSpacing = CGFloat(40)
    public static let sectionTitleSpacing = CGFloat(20)
    public static let smallSectionSpacing = CGFloat(10)

    // icons
    public static let mediumIconSize = CGFloat(40)
    public static let smallIconSize = CGFloat(20)
  }

  enum Text {
    public static let largeTitle = CGFloat(23)
    public static let mediumTitle = CGFloat(20)
    public static let smallTitle = CGFloat(17)
    public static let subtitle = CGFloat(15)
    public static let text = CGFloat(13)
  }

  enum Button {
    public static let smallPadding = CGFloat(12)
  }

  enum Card {
    public static let cornerRadius = CGFloat(10)
  }

  enum HeaderView {
    public static let height = CGFloat(50)
  }

  enum TabView {
    public static let height = CGFloat(70)
    public static let itemHeight = CGFloat(60)
    public static let landscapeHeight = CGFloat(40)
    public static let landscapeItemHeight = CGFloat(30)
    public static let cornerRadius = CGFloat(50)
    public static let iconTextSpacing = CGFloat(10)
    public static let iconSize = CGFloat(20)
    public static let textFont = CGFloat(14)
    public static let itemWidth = CGFloat(UIScreen.main.bounds.width / 4 - 30)
    public static let landscapeItemWidth = CGFloat(90)
  }

  // Home Page
  enum HeroCard {
    public static let height = CGFloat(150)
  }

  enum Brands {
    public static let iconSpacing = CGFloat(25)
    public static let textSpacing = CGFloat(10)
  }

  enum ProductsGrid {
    public static let spacing = CGFloat(10)
  }

  // Details Page
  enum ImageList {
    public static let imageSize = CGFloat(100)
  }

  enum ProductCount {
    public static let width = CGFloat(120)
  }

  // Cart Page
  enum CartItem {
    public static let height = CGFloat(150)
  }
}

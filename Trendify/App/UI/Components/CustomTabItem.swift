//
//  CustomTabItem.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-10.
//

import SwiftUI

struct CustomTabItem: View {
  let imageName: String
  let title: String
  let isActive: Bool

  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  var body: some View {
    HStack(spacing: Constants.TabView.iconTextSpacing) {
      Spacer()
      Image(imageName)
        .resizable()
        .renderingMode(.template)
        .frame(width: Constants.TabView.iconSize, height: Constants.TabView.iconSize)
      if isActive {
        if verticalSizeClass == .regular {
          Text(title)
            .font(.custom(OrbitronFonts.semiBold, size: Constants.TabView.textFont))
        }
      }
      Spacer()
    }
    .foregroundColor(isActive ? .white : Colors.General.AccentColor)
    .frame(width: isActive ?
      nil :
      verticalSizeClass == .regular ?
      Constants.TabView.itemWidth :
      Constants.TabView.landscapeItemWidth,
      height: verticalSizeClass == .regular ?
        Constants.TabView.itemHeight :
        Constants.TabView.landscapeItemHeight)
    .background(isActive ? Colors.General.AccentColor : .clear)
    .cornerRadius(Constants.TabView.cornerRadius)
  }
}

#Preview {
  CustomTabItem(imageName: "home-icon", title: "Home", isActive: true)
}

//
//  CustomTabItem.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-10.
//

// import SwiftUI
//
// struct CustomTabItem: View {
//  let imageName: String
//  let title: String
//  let isActive: Bool
//
//  @Environment(\.verticalSizeClass)
//  var verticalSizeClass
//
//  var body: some View {
//    HStack(spacing: Constants.TabView.iconTextSpacing) {
//      Spacer()
//      Image(imageName)
//        .resizable()
//        .renderingMode(.template)
//        .frame(width: Constants.TabView.iconSize, height: Constants.TabView.iconSize)
//      if isActive {
//        if verticalSizeClass == .regular {
//          Text(title)
//            .font(.custom(OrbitronFonts.semiBold, size: Constants.TabView.textFont))
//        }
//      }
//      Spacer()
//    }
//    .foregroundColor(isActive ? .white : Colors.General.AccentColor)
//    .frame(width: isActive ?
//      nil :
//      verticalSizeClass == .regular ?
//      Constants.TabView.itemWidth :
//      Constants.TabView.landscapeItemWidth,
//      height: verticalSizeClass == .regular ?
//        Constants.TabView.itemHeight :
//        Constants.TabView.landscapeItemHeight)
//    .background(isActive ? Colors.General.AccentColor : .clear)
//    .cornerRadius(Constants.TabView.cornerRadius)
//  }
// }
//
// #Preview {
//  CustomTabItem(imageName: "home-icon", title: "Home", isActive: true)
// }

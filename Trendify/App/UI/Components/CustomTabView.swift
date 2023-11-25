//
//  CustomTabView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct CustomTabView: View {
  @Binding var currentTab: Tabs

  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  var body: some View {
    HStack {
      ForEach(Tabs.allCases, id: \.self) { item in
        CustomTabItem(imageName: item.iconName, title: item.title, isActive: currentTab == item)
          .onTapGesture {
            withAnimation {
              currentTab = item
            }
          }
      }
    }
    .padding(Constants.General.padding5)
    .frame(
      width: verticalSizeClass == .regular ? nil : 500,
      height: verticalSizeClass == .regular ? Constants.TabView.height : Constants.TabView.landscapeHeight
    )
    .background(.regularMaterial)
    .cornerRadius(Constants.TabView.cornerRadius)
    .padding(.horizontal)
  }
}

#Preview {
  CustomTabView(currentTab: .constant(Tabs.home))
}

//
//  CustomTabView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

// import SwiftUI
//
// struct CustomTabView: View {
//  @Binding var currentTab: Tabs
//
//  @Environment(\.verticalSizeClass)
//  var verticalSizeClass
//
//  var body: some View {
//    HStack {
//      ForEach(Tabs.allCases, id: \.self) { item in
//        CustomTabItem(imageName: item.iconName, title: item.title, isActive: currentTab == item)
//          .onTapGesture {
//            withAnimation {
//              currentTab = item
//            }
//          }
//      }
//    }
//    .frame(width: 400, height: verticalSizeClass == .regular ? Constants.TabView.height : Constants.TabView.landscapeHeight)
//    .background(.regularMaterial)
//    .cornerRadius(Constants.TabView.cornerRadius)
//    .padding(.horizontal)
//  }
// }
//
// #Preview {
//  CustomTabView(currentTab: .constant(Tabs.home))
// }

//
//  Header.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

typealias IconActionFunction = () -> Void

struct CustomNavigationBar: View {
  let title: String
  var leadingIcon: String?
  var trailingIcon: String?
  var leadingIconAction: IconActionFunction?
  var trailingIconAction: IconActionFunction?

  init(title: String, leadingIcon: String, trailingIcon: String, leadingIconAction: @escaping IconActionFunction, trailingIconAction: @escaping IconActionFunction) {
    self.title = title
    self.leadingIcon = leadingIcon
    self.trailingIcon = trailingIcon
    self.leadingIconAction = leadingIconAction
    self.trailingIconAction = trailingIconAction
  }

  init(title: String, leadingIcon: String, leadingIconAction: @escaping IconActionFunction) {
    self.title = title
    self.leadingIcon = leadingIcon
    self.leadingIconAction = leadingIconAction
  }

  init(title: String, trailingIcon: String, trailingIconAction: @escaping IconActionFunction) {
    self.title = title
    self.trailingIcon = trailingIcon
    self.trailingIconAction = trailingIconAction
  }

  init(title: String) {
    self.title = title
  }

  var body: some View {
    ZStack {
      Color.clear
        .background(.ultraThinMaterial)

      HStack {
        if let leadingIcon = leadingIcon, let leadingIconAction = leadingIconAction {
          Button {
            leadingIconAction()
          } label: {
            Image(systemName: leadingIcon)
              .foregroundStyle(Colors.General.DarkTextColor)
          }
        }
        Spacer()
        if let trailingIcon = trailingIcon, let trailingIconAction = trailingIconAction {
          Button {
            trailingIconAction()
          } label: {
            Image(systemName: trailingIcon)
              .foregroundStyle(Colors.General.DarkTextColor)
          }
        }
      }
      .padding()

      LargeTitle(title)
        .foregroundStyle(Colors.General.DarkTextColor)
    }
    .foregroundStyle(.black)
    .font(.custom(OrbitronFonts.bold, size: Constants.Text.mediumTitle))
    .frame(height: Constants.HeaderView.height)
    .frame(maxHeight: .infinity, alignment: .top)
  }
}

#Preview {
  CustomNavigationBar(title: "Hi there", leadingIcon: "bell", trailingIcon: "person") {
    print("")
  } trailingIconAction: {
    print("")
  }
}

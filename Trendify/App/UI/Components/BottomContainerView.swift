//
//  BottomContainerView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-13.
//

import SwiftUI

struct BottomContainerView<Content: View>: View {
  @ViewBuilder var content: () -> Content

  var body: some View {
    ZStack(alignment: .top) {
      Color.clear
        .background(Colors.General.LightestAccentColor)
      content()
    }
    .background(
      Color.white
        .shadow(radius: 10)
    )
    .frame(height: 70)
    .frame(maxHeight: .infinity, alignment: .bottom)
  }
}

#Preview {
  BottomContainerView {
    Text("Hello")
  }
}

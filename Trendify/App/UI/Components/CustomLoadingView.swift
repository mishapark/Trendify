//
//  CustomLoadingView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-13.
//

import SwiftUI

struct CustomLoadingView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      ProgressView()
        .tint(Colors.General.AccentColor)
      RegularText("Loading...")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Colors.General.BackgroundColor)
  }
}

#Preview {
  CustomLoadingView()
}

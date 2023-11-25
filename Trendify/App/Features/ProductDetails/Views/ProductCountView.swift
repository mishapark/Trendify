//
//  ProductCountView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct ProductCountView: View {
  @Binding var count: Int
  var minusDisabled: Bool {
    count == 1
  }

  var plusDisabled: Bool {
    count == 99
  }

  var body: some View {
    HStack {
      CircleButton(text: "-", isDisabled: minusDisabled) {
        count -= 1
      }
      Spacer()
      Text(String(format: "%02d", count))
      Spacer()
      CircleButton(text: "+", isDisabled: plusDisabled) {
        count += 1
      }
    }
    .frame(width: 90)
    .font(.custom(OrbitronFonts.bold, size: Constants.Text.smallTitle))
    .padding(.horizontal, Constants.General.padding5)
    .background(Colors.General.LightAccentColor)
    .clipShape(Capsule())
  }
}

#Preview {
  VStack {
    ProductCountView(count: .constant(99))
  }
}

struct CircleButton: View {
  let text: String
  let isDisabled: Bool
  let action: () -> Void

  var body: some View {
    Button {
      if !isDisabled {
        action()
      }
    } label: {
      Text(text)
        .padding(Constants.General.padding5)
        .background(isDisabled ? Colors.General.LightestAccentColor : .black)
        .foregroundStyle(isDisabled ? .black : .white)
        .clipShape(Circle())
    }
    .disabled(isDisabled)
  }
}

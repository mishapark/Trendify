//
//  SizesView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct SizesView: View {
  let sizes: [String]
  @Binding var activeSize: String

  let rows: [GridItem] = [.init(.flexible(), spacing: 10), .init(.flexible(), spacing: 10)]

  var body: some View {
    ScrollView(.horizontal) {
      if sizes.count > 1 {
        LazyHGrid(rows: rows, spacing: 10) {
          ForEach(sizes, id: \.self) { size in
            createSizeButton(for: size)
          }
        }
        .accessibilityIdentifier("SizesGrid")
        .padding(.horizontal)
      } else {
        createSizeButton(for: sizes[0])
          .padding(.horizontal)
      }
    }
    .scrollIndicators(.hidden)
  }

  @ViewBuilder
  private func createSizeButton(for size: String) -> some View {
    Button {
      withAnimation {
        if activeSize == size {
          activeSize = ""
        } else {
          activeSize = size
        }
      }
    } label: {
      RegularText(size, color: activeSize == size ? Colors.General.LightTextColor : Colors.General.DarkTextColor)
        .frame(height: 10)
        .frame(maxWidth: .infinity)
        .padding()
        .background(activeSize == size ? Colors.General.DarkTextColor : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(.black, lineWidth: 1)
        )
        .padding(2)
    }
  }
}

#Preview {
  SizesView(sizes: ["US 5", "US 6", "US 7", "US 8888888"], activeSize: .constant("US 5"))
}

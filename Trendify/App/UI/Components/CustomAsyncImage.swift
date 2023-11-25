//
//  CustomAsyncImage.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct CustomAsyncImage<Content: View>: View {
  let url: String
  let imageModifier: (Image) -> Content

  var body: some View {
    AsyncImage(url: URL(string: "https://" + url)) { phase in
      switch phase {
      case .success(let image):
        imageModifier(image)
      case .empty:
        imageModifier(Image("placeholder"))
      case .failure:
        imageModifier(Image("placeholder"))
      @unknown default:
        ProgressView()
      }
    }
  }
}

#Preview {
  CustomAsyncImage(url: Product.products[0].imageUrl) { image in
    image
      .resizable()
      .scaledToFill()
      .frame(minWidth: 0, maxWidth: .infinity)
      .clipped()
      .overlay {
        LinearGradient(
          colors: [.clear, .black],
          startPoint: .center,
          endPoint: .bottom
        ).opacity(0.5)
      }
  }
}

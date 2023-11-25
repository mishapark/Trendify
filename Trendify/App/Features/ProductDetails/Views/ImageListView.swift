//
//  ImageListView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct ImageListView: View {
  let productDetails: ProductDetails

  @Binding var activeImage: String

  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: Constants.General.padding10) {
        ForEach(productDetails.media.images.map { $0.url }, id: \.self) { url in
          Button {
            activeImage = url
          } label: {
            CustomAsyncImage(url: url) { image in
              image
                .resizable()
                .scaledToFill()
                .frame(width: Constants.ImageList.imageSize, height: Constants.ImageList.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
                .overlay(
                  RoundedRectangle(cornerRadius: Constants.Card.cornerRadius)
                    .stroke(.black, lineWidth: activeImage == url ? 3 : 0)
                )
                .padding(2)
            }
          }
          .buttonStyle(NoHighlightButtonStyle())
        }
      }
      .padding(.horizontal)
    }
    .scrollIndicators(.hidden)
  }
}

#Preview {
  ImageListView(
    productDetails: ProductDetails.products[0],
    activeImage: .constant(ProductDetails.products[0].media.images[0].url)
  )
}

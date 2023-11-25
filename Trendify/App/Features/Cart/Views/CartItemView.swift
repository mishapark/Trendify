//
//  CartItemView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-14.
//

import SwiftUI

struct CartItemView: View {
  @Binding var productDetails: ProductDetails
  @Binding var count: Int
  @Binding var size: String
  let deleteItem: () -> Void

  var body: some View {
    let totalPrice = productDetails.price.current.value * Double(count)

    HStack {
      CustomAsyncImage(url: productDetails.media.images[0].url) { image in
        image
          .resizable()
          .scaledToFill()
          .frame(width: Constants.CartItem.height, height: Constants.CartItem.height)
          .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
      }

      VStack(alignment: .leading) {
        LargeRegularText(productDetails.name)
          .lineLimit(3)
          .padding(.bottom, Constants.General.padding10)
        RegularText("Size: ")
        Subtitle(size)
        Spacer()
        ProductCountView(count: $count)
      }
      Spacer()
      VStack(alignment: .trailing) {
        SmallTitle(String(format: "$%.2f", totalPrice))
          .frame(
            maxWidth: 130,
            alignment: .trailing)
        Spacer()
        Button {
          deleteItem()
        } label: {
          TransparentCircleButton(icon: "trash")
            .foregroundStyle(.red)
        }
      }
    }
    .frame(height: Constants.CartItem.height)
  }
}

#Preview {
  CartItemView(productDetails: .constant(ProductDetails.products[0]), count: .constant(1), size: .constant("US 5")) {}
}

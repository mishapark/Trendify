//
//  ProductCardView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

struct ProductCardView: View {
  let product: Product

  @EnvironmentObject var profile: ProfileViewModel

  var body: some View {
    ZStack {
      CustomAsyncImage(url: product.imageUrl) { image in
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
      VStack(alignment: .trailing) {
        Button {
          profile.addOrDeleteProduct(product: product)
        } label: {
          if profile.favoriteProducts.contains(where: { $0.id == product.id }) {
            ColoredCircleButton(icon: "heart.fill", color: .red)
          } else {
            TransparentCircleButton(icon: "heart")
              .foregroundStyle(.red)
          }
        }

        Spacer()

        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            SmallTitle(product.brandName, color: .white)
              .minimumScaleFactor(0.5)
              .lineLimit(1)
            RoundedRectangleText(String(format: "$%.2f", product.price.current.value))
          }

          Spacer()

          NavigationLink(value: NavigationPaths.productDetails(product)) {
            BlackSquareButton(icon: "arrow.right")
          }
        }
      }
      .padding()
    }
    .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
  }
}

#Preview {
  ProductCardView(product: Product.products[0])
    .environmentObject(ProfileViewModel())
}

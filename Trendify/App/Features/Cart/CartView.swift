//
//  CartView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-13.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cart: CartViewModel

  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack(spacing: Constants.General.smallSectionSpacing) {
          if !cart.items.isEmpty {
            RoundedRectangleText("\(cart.totalItemsQuantity) Item(s)")
              .padding(.bottom, Constants.General.padding10)

            ForEach($cart.items) { $product in
              CartItemView(productDetails: $product.productDetails, count: $product.count, size: $product.size) {
                cart.removeCartItem(item: product)
              }
              .padding(.bottom, Constants.General.padding10)
              .padding(.horizontal)
            }

            Spacer()

            AmountView()
              .padding(.horizontal)

            NavigationLink {
              CheckoutView()
                .environmentObject(cart)
            } label: {
              AccentTextButton(text: "Checkout", icon: "arrow.right", size: .big)
            }
          } else {
            EmptyView(title: "Cart is empty")
              .padding(.horizontal)
          }
        }
        .padding(.top, Constants.General.pageTopPadding)
        .padding(.bottom, Constants.General.pageBottomPadding)
        .frame(minHeight: geometry.size.height)
      }
      .frame(maxWidth: .infinity)
    }
    .scrollIndicators(.hidden)
    .background(Colors.General.BackgroundColor)
    .overlay {
      CustomNavigationBar(title: "My Cart")
    }
  }
}

#Preview {
  CartView()
    .environmentObject(CartViewModel())
}

//
//  ProductsView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

struct ProductsView: View {
  let title: String

  @EnvironmentObject var home: HomeViewModel

  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  let columns: [GridItem] = [
    .init(.flexible()),
    .init(.flexible())
  ]

  let landscapeColumns: [GridItem] = [
    .init(.flexible()),
    .init(.flexible()),
    .init(.flexible())
  ]

  var body: some View {
    VStack(alignment: .leading, spacing: Constants.General.sectionTitleSpacing) {
      MediumTitle(title)

      if let products = home.products, !home.isProductsLoading {
        LazyVGrid(
          columns: verticalSizeClass == .regular ? columns : landscapeColumns,
          spacing: Constants.ProductsGrid.spacing
        ) {
          ForEach(products, id: \.id) { product in
            NavigationLink(value: NavigationPaths.productDetails(product)) {
              ProductCardView(product: product)
            }
            .buttonStyle(NoHighlightButtonStyle())
          }
        }
        .accessibilityIdentifier("ProductsGrid")
      } else if home.isProductsLoading {
        CustomLoadingView()
      } else {
        EmptyView(title: "No products to display")
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  ProductsView(title: "Popular Products")
    .environmentObject(HomeViewModel())
}

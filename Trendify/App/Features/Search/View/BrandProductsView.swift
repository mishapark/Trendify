//
//  BrandProductsView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import SwiftUI

struct BrandProductsView: View {
  let categoryId: Int?

  @StateObject var viewModel = BrandProductsViewModel()

  @Environment(\.dismiss)
  var dismiss

  let columns: [GridItem] = [
    .init(.flexible()),
    .init(.flexible())
  ]

  var body: some View {
    ZStack {
      if let categoryId = categoryId {
        ScrollView {
          if let products = viewModel.products {
            LazyVGrid(columns: columns, spacing: Constants.ProductsGrid.spacing) {
              ForEach(products, id: \.id) { product in
                NavigationLink(value: NavigationPaths.productDetails(product)) {
                  ProductCardView(product: product)
                }
                .buttonStyle(NoHighlightButtonStyle())
              }
            }
            .accessibilityIdentifier("ProductsByBrandsList")
            .padding(.horizontal)
          } else {
            CustomLoadingView()
          }
        }
        .task {
          await viewModel.fetchProducts(categoryId: categoryId)
        }
      } else {
        Text("Wrong id")
      }
    }
    .toolbar(.hidden)
    .padding(.top, Constants.General.pageTopPadding)
    .scrollIndicators(.hidden)
    .background(Colors.General.BackgroundColor)
    .overlay {
      CustomNavigationBar(title: viewModel.products?[0].brandName ?? "Search", leadingIcon: "chevron.left") {
        dismiss()
      }
    }
  }
}

#Preview {
  BrandProductsView(categoryId: 29811)
}

//
//  FavoritesView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-20.
//

import SwiftUI

struct FavoritesView: View {
  @EnvironmentObject var profile: ProfileViewModel
  @Environment(\.dismiss)
  var dismiss
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
    ZStack {
      ScrollView {
        if !profile.favoriteProducts.isEmpty {
          LazyVGrid(
            columns: verticalSizeClass == .regular ? columns : landscapeColumns,
            spacing: Constants.ProductsGrid.spacing
          ) {
            ForEach(profile.favoriteProducts, id: \.id) { product in
              NavigationLink(value: NavigationPaths.productDetails(product)) {
                ProductCardView(product: product)
              }
              .buttonStyle(NoHighlightButtonStyle())
            }
          }
          .padding(.horizontal)
        } else {
          MediumTitle("No favorites")
        }
      }
      .frame(maxWidth: .infinity)
      .toolbar(.hidden)
      .padding(.top, Constants.General.pageTopPadding)
      .scrollIndicators(.hidden)
      .background(Colors.General.BackgroundColor)
      .overlay {
        CustomNavigationBar(title: "Favorites", leadingIcon: "chevron.left") {
          dismiss()
        }
      }
    }
  }
}

#Preview {
  FavoritesView()
    .environmentObject(ProfileViewModel())
}

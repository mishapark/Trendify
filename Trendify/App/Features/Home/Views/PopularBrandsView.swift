//
//  PopularBrandsView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

struct PopularBrandsView: View {
  @EnvironmentObject var home: HomeViewModel

  let brands: [String] = [
    "adidas", "converse", "fila", "nike", "puma", "reebok"
  ]

  var body: some View {
    VStack(alignment: .leading, spacing: Constants.General.sectionTitleSpacing) {
      MediumTitle("Popular Brands")
        .padding(.horizontal)

      ScrollView(.horizontal) {
        LazyHStack(spacing: Constants.Brands.iconSpacing) {
          ForEach(brands, id: \.self) { brand in
            Button {
              if home.selectedBrand == brand {
                home.selectedBrand = ""
                Task {
                  await home.fetchProducts()
                }
              } else {
                home.selectedBrand = brand
                Task {
                  await home.fetchProductsByBrand(brandName: brand)
                }
              }
            } label: {
              if home.selectedBrand == brand {
                SelectedCircleIconButtonWithText(
                  icon: brand,
                  text: brand.capitalized,
                  size: Constants.General.mediumIconSize
                )
                .padding(2)
              } else {
                CircleIconButtonWithText(icon: brand, text: brand.capitalized, size: Constants.General.mediumIconSize)
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
}

#Preview {
  PopularBrandsView()
    .environmentObject(HomeViewModel())
}

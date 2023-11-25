//
//  SearchView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import SwiftUI

struct SearchView: View {
  @EnvironmentObject var home: HomeViewModel

  @State var searchText: String = ""

  var body: some View {
    var searchResults: [CategoryBrand] {
      if let brands = home.brands {
        if searchText.isEmpty {
          return brands
        } else {
          return brands.filter { $0.content.title.lowercased().contains(searchText.lowercased()) }
        }
      } else {
        return []
      }
    }

    ZStack {
      VStack {
        CustomTextField( text: $searchText, placeholder: "Search brand", icon: "magnifyingglass")
          .padding(.bottom, 10)
          .padding(.horizontal)
        ScrollView {
          if home.brands != nil, !home.isBrandsLoading {
            LazyVStack(spacing: 2) {
              ForEach(searchResults, id: \.link.categoryId) { brand in
                NavigationLink(value: NavigationPaths.brandProducts(brand.link.categoryId)) {
                  HStack {
                    SmallTitle(brand.content.title)
                    Spacer()
                    Image(systemName: "chevron.right")
                  }
                  .frame(maxWidth: .infinity)
                  .padding()
                  .background(Colors.General.LightestAccentColor)
                }
              }
            }
            .accessibilityIdentifier("ProductsSearchList")
            .searchable(text: $searchText)
          } else if home.brands == nil {
            EmptyView(title: "No brands")
          } else {
            CustomLoadingView()
          }
        }
      }
      .padding(.top, Constants.General.pageTopPadding)
      .scrollIndicators(.hidden)
      .background(Colors.General.BackgroundColor)
      .overlay {
        CustomNavigationBar(title: "Search")
      }

      if home.brandsError != nil {
        CustomAlertView(title: home.brandsError, primaryButtonLabel: "Ok") {
          home.brandsError = nil
        }
      }
    }
  }
}

#Preview {
  SearchView()
    .environmentObject(HomeViewModel())
}

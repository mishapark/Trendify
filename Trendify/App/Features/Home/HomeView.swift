//
//  HomeView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var home: HomeViewModel

  var body: some View {
    ScrollViewReader { proxy in
      ZStack {
        ScrollView {
          VStack(alignment: .center, spacing: Constants.General.sectionSpacing) {
            HeroCardView {
              withAnimation {
                proxy.scrollTo("products", anchor: .top)
              }
            }

            PopularBrandsView()

            ProductsView(title: "Popular products")
              .id("products")
          }
          .padding(.top, Constants.General.pageTopPadding)
          .padding(.bottom, Constants.General.pageBottomPadding)
        }
        .scrollIndicators(.hidden)
        .background(Colors.General.BackgroundColor)
        .overlay {
          CustomNavigationBar(title: "Hi There!", leadingIcon: "line.3.horizontal.decrease", trailingIcon: "bell") {
            print("lead")
          } trailingIconAction: {
            print("trail")
          }
        }

        if home.productsError != nil {
          CustomAlertView(title: home.productsError, primaryButtonLabel: "Ok") {
            home.productsError = nil
          }
        }
      }
    }
  }
}

#Preview {
  HomeView()
    .environmentObject(HomeViewModel())
}

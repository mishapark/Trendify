//
//  ProducDetailsView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import SwiftUI

struct ProductDetailsView: View {
  let product: Product

  @StateObject var viewModel = ProductDetailsViewModel()
  @State var isAlertPresented = false

  @EnvironmentObject var settings: ContentViewModel
  @EnvironmentObject var cart: CartViewModel

  @Environment(\.dismiss)
  var dismiss
  @Environment(\.verticalSizeClass)
  var verticalSizeClass

  var body: some View {
    let totalPrice = product.price.current.value * Double(viewModel.quantity)

    Group {
      if let productDetails = viewModel.productDetails {
        ZStack {
          ScrollView {
            VStack {
              MediumTitle(productDetails.name)
                .padding(.horizontal)
                .multilineTextAlignment(.center)

              CustomAsyncImage(url: viewModel.activeImage) { image in
                image
                  .resizable()
                  .scaledToFill()
                  .frame(
                    width: verticalSizeClass == .regular ? nil : 300,
                    height: verticalSizeClass == .regular ? nil : 400
                  )
                  .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
                  .padding(.horizontal)
              }
              .onAppear {
                viewModel.activeImage = productDetails.media.images[0].url
              }

              ImageListView(productDetails: productDetails, activeImage: $viewModel.activeImage)
                .padding(.bottom, Constants.General.smallSectionSpacing)

              HStack(alignment: .bottom) {
                SmallTitle("Size")
                Spacer()
                ProductCountView(count: $viewModel.quantity)
              }
              .padding(.horizontal)
              .padding(.bottom, Constants.General.smallSectionSpacing)

              SizesView(sizes: productDetails.variants.map { $0.brandSize }, activeSize: $viewModel.activeSize)
                .padding(.bottom, Constants.General.smallSectionSpacing)

              VStack(alignment: .leading) {
                SmallTitle("Product Details")
                  .padding(.horizontal)
                  .padding(.bottom, Constants.General.smallSectionSpacing)
                ProductDescriptionView(text: productDetails.description)
                  .padding(.horizontal)
              }
              .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, Constants.General.pageTopPadding)
            .padding(.bottom, Constants.General.pageBottomPadding)
          }
          .scrollIndicators(.hidden)
          .background(Colors.General.BackgroundColor)
          .overlay {
            CustomNavigationBar(title: product.brandName, leadingIcon: "chevron.left") {
              dismiss()
            }
            BottomContainerView {
              AddToCartView(price: String(format: "$%.2f", totalPrice), isDisabled: viewModel.activeSize.isEmpty) {
                withAnimation {
                  cart.addToCart(
                    productDetails: productDetails,
                    quantity: viewModel.quantity,
                    size: viewModel.activeSize
                  )
                  isAlertPresented = true
                }
              }
            }
          }

          if isAlertPresented {
            CustomAlertView(
              title: "Woo Hoo!",
              message: "Product added to your cart",
              primaryButtonLabel: "Go to cart",
              secondaryButtonLabel: "Continue shopping"
            ) {
              settings.currentTab = .cart
              settings.path = []
            } secondaryButtonAction: {
              isAlertPresented = false
            } tapOutside: {
              isAlertPresented = false
            }
          }
        }
      } else {
        ZStack {
          CustomLoadingView()
            .overlay {
              CustomNavigationBar(title: product.brandName, leadingIcon: "chevron.left") {
                dismiss()
              }
            }
          if viewModel.error != nil {
            CustomAlertView(title: viewModel.error, primaryButtonLabel: "Ok") {
              viewModel.error = nil
            }
          }
        }
      }
    }
    .toolbar(.hidden)
    .onAppear {
      withAnimation {
        settings.isTabViewVisible = false
        viewModel.productId = product.id
      }
    }
  }
}

#Preview {
  ProductDetailsView(product: Product.products[0])
    .environmentObject(ContentViewModel())
}

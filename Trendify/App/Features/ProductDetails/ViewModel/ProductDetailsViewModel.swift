//
//  ProductDetailsViewModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import Foundation

class ProductDetailsViewModel: ObservableObject {
  @Published var productId: Int?
  @Published var productDetails: ProductDetails?

  @Published var activeImage: String = ""
  @Published var quantity: Int = 1
  @Published var activeSize: String = ""
  @Published var totalPrice: Double = 0

  @Published var error: String?
  @Published var isLoading = false

  init() {
    Task {
      await fetchProductDetails()
    }
  }

  @MainActor
  func fetchProductDetails() async {
    guard let productId = productId else { return }

    let url = ProductEndpoints.productDetails(id: productId)

    do {
      isLoading = true
      defer {
        isLoading = false
      }
      productDetails = try await ProductService().fetchProductDetails(url: url)
    } catch {
      self.error = error.localizedDescription
    }
  }
}

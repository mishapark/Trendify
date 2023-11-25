//
//  BrandProductsViewModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import Foundation

class BrandProductsViewModel: ObservableObject {
  @Published var products: [Product]?
  @Published var error: String?
  @Published var isLoading = false

  @MainActor
  func fetchProducts(categoryId: Int) async {
    let url = ProductEndpoints.list(category: "\(categoryId)", limit: 50, sort: Sort.freshness)

    do {
      isLoading = true
      defer {
        isLoading = false
      }
      products = try await ProductService().fetchProductsList(url: url)
    } catch {
      self.error = error.localizedDescription
    }
  }
}

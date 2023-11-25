//
//  HomeViewModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import Foundation

class HomeViewModel: ObservableObject {
  @Published var products: [Product]?
  @Published var brands: [CategoryBrand]?
  @Published var selectedBrand = ""
  @Published var productsError: String?
  @Published var brandsError: String?
  @Published var isProductsLoading = false
  @Published var isBrandsLoading = false

  init() {
    Task {
      await fetchProducts()
      await fetchBrands()
    }
  }

  @MainActor
  func fetchProducts() async {
    isProductsLoading = true
    defer {
      isProductsLoading = false
    }
    let url = ProductEndpoints.list(category: "3606", limit: 30, sort: Sort.freshness)
    do {
      products = try await ProductService().fetchProductsList(url: url)
    } catch {
      productsError = error.localizedDescription
    }
  }

  @MainActor
  func fetchBrands() async {
    isBrandsLoading = true
    defer {
      isBrandsLoading = false
    }
    let url = CategoryEndpoints.list()
    do {
      brands = try await CategoryService().fetchCategoryList(url: url)
    } catch {
      brandsError = error.localizedDescription
    }
  }

  @MainActor
  func fetchProductsByBrand(brandName: String) async {
    isProductsLoading = true
    defer {
      isProductsLoading = false
    }
    do {
      guard let brands = brands else { return }

      let selectedBrand = brands.first { brand in
        brand.content.title.lowercased() == brandName.lowercased()
      }
      guard let selectedBrand = selectedBrand, let id = selectedBrand.link.categoryId else { return }

      let url = ProductEndpoints.list(category: "\(id)", limit: 30, sort: Sort.freshness)
      products = try await ProductService().fetchProductsList(url: url)
    } catch {
      productsError = error.localizedDescription
    }
  }
}

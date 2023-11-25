//
//  ProductService.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import Foundation

struct ProductService {
  func fetchProductsList(url: String) async throws -> [Product] {
    do {
      let data = try await APIService.shared.fetchFromAPI(url: url)
      guard let products = try JSONDecoder().decode(ProductsList.self, from: data).products else {
        throw APIError.failedToDecode
      }
      return products
    } catch {
      throw error
    }
  }

  func fetchProductDetails(url: String) async throws -> ProductDetails {
    do {
      let data = try await APIService.shared.fetchFromAPI(url: url)
      let product = try JSONDecoder().decode(ProductDetails.self, from: data)
      return product
    } catch {
      throw error
    }
  }
}

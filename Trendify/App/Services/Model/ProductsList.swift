//
//  Product.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-09.
//

import Foundation

struct ProductsList: Codable {
  let categoryName: String
  let itemCount: Int
  let products: [Product]?
}

struct Product: Codable, Identifiable, Hashable {
  let id: Int
  let name: String
  let price: Price
  let imageUrl: String
  let brandName: String

  static func == (lhs: Product, rhs: Product) -> Bool {
    lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

struct Price: Codable {
  let current: CurrentPrice
  let currency: String
}

struct CurrentPrice: Codable {
  let value: Double
}

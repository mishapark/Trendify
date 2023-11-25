//
//  ProductListEndpoint.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-10.
//

import Foundation

enum Sort: String {
  case pricedesc, priceasc, freshness
}

enum ProductEndpoints {
  static func list(category: String, limit: Int, sort: Sort) -> String {
    return "https://asos2.p.rapidapi.com/products/v2/list?store=US&offset=0&categoryId=\(category)&limit=\(limit)&country=US&sort=\(sort.rawValue)&currency=USD&sizeSchema=US&lang=en-US"
  }
  static func productDetails(id: Int) -> String {
    return "https://asos2.p.rapidapi.com/products/v3/detail?id=\(id)&lang=en-US&store=US&sizeSchema=US&currency=USD"
  }
}

enum CategoryEndpoints {
  static func list() -> String {
    return "https://asos2.p.rapidapi.com/categories/list?country=US&lang=en-US"
  }
}

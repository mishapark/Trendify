//
//  CategoryService.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import Foundation

struct CategoryService {
  func fetchCategoryList(url: String) async throws -> [CategoryBrand] {
    do {
      let data = try await APIService.shared.fetchFromAPI(url: url)
      var menBrands: [CategoryBrand] = []
      let brandsByType = try JSONDecoder().decode(CategoryListResponse.self, from: data).brands
      menBrands = brandsByType[0].children
      return menBrands
    } catch {
      throw error
    }
  }
}

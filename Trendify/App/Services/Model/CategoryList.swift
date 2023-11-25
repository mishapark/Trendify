//
//  CategoryList.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-18.
//

import Foundation

struct CategoryListResponse: Codable {
  let brands: [BrandByType]
}

struct BrandByType: Codable {
  let content: BrandTypeContent
  let children: [CategoryBrand]
}

struct BrandTypeContent: Codable {
  let title: String
}

struct CategoryBrand: Codable {
  let content: CategoryBrandContent
  let link: CategoryBrandLink
}

struct CategoryBrandContent: Codable {
  let title: String
}

struct CategoryBrandLink: Codable {
  let categoryId: Int?
}

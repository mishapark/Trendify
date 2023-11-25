//
//  ProductDetail.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import Foundation

struct ProductDetails: Identifiable, Codable {
  let id: Int
  let name: String
  let description: String
  let gender: String
  let brand: Brand
  let variants: [ProductVariant]
  let media: Media
  let price: Price
  let rating: Rating?
}

struct Brand: Codable {
  let name: String
}

struct ProductVariant: Codable {
  let brandSize: String
}

struct Media: Codable {
  let images: [ProductImage]
}

struct ProductImage: Codable {
  let url: String
}

struct Rating: Codable {
  let averageOverallRating: Double
}

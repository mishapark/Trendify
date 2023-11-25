//
//  ProductExtension.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import Foundation

extension Product {
  public static var products: [Product] = [
    Product(
      id: 1,
      name: "Shoes With smooth cool soles and good for running",
      price: Price(current: CurrentPrice(value: 123), currency: "US"),
      imageUrl: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg",
      brandName: "Nike"
    ),
    Product(
      id: 2,
      name: "Shoes With smooth cool soles and good for running",
      price: Price(current: CurrentPrice(value: 123), currency: "US"),
      imageUrl: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg",
      brandName: "Nike"
    ),
    Product(
      id: 3,
      name: "Shoes With smooth cool soles and good for running",
      price: Price(current: CurrentPrice(value: 123), currency: "US"),
      imageUrl: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg",
      brandName: "Nike"
    ),
    Product(
      id: 4,
      name: "Shoes With smooth cool soles and good for running",
      price: Price(current: CurrentPrice(value: 123), currency: "US"),
      imageUrl: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg",
      brandName: "Nike"
    ),
    Product(
      id: 5,
      name: "Shoes With smooth cool soles and good for running",
      price: Price(current: CurrentPrice(value: 123), currency: "US"),
      imageUrl: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg",
      brandName: "Nike"
    )
  ]
}

extension ProductDetails {
  public static var products: [ProductDetails] = [
    .init(
      id: 1,
      name: "Nike Roshe Run",
      description: "Cool shoes",
      gender: "Men",
      brand: Brand(name: "Nike"),
      variants: [ProductVariant(brandSize: "8 US")],
      media: Media(
        images: [ProductImage(url: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg")]
      ),
      price: Price(current: CurrentPrice(value: 123.0), currency: "US"),
      rating: Rating(averageOverallRating: 5)
    ),
    .init(
      id: 2,
      name: "Nike Roshe Run",
      description: "Cool shoes",
      gender: "Men",
      brand: Brand(name: "Nike"),
      variants: [ProductVariant(brandSize: "8 US")],
      media: Media(
        images: [ProductImage(url: "static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/64265cce-0cfc-4309-aa45-33835124eeaa/nike-air-max-air-max-day.jpg")]
      ),
      price: Price(current: CurrentPrice(value: 123.0), currency: "US"),
      rating: Rating(averageOverallRating: 5)
    )
  ]
}

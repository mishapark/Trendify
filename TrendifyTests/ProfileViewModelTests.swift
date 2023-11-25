//
//  ProfileViewModelTests.swift
//  TrendifyTests
//
//  Created by Mikhail Pak on 2023-11-25.
//

@testable import Trendify
import XCTest

final class ProfileViewModelTests: XCTestCase {
  var viewModel: ProfileViewModel?

  override func setUpWithError() throws {
    viewModel = ProfileViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
  }

  @MainActor
  func test_favorites_addOrDeleteProduct() {
    guard let viewModel = viewModel else { return }

    let count = viewModel.favoriteProducts.count

    viewModel.addOrDeleteProduct(product:
      Product(
        id: 1,
        name: "Nike Shoes",
        price: Price(current: CurrentPrice(value: 10.0), currency: "USD"),
        imageUrl: "img.png",
        brandName: "Nike"
      )
    )

    XCTAssertEqual(viewModel.favoriteProducts.count, count + 1)

    viewModel.addOrDeleteProduct(product:
      Product(
        id: 1,
        name: "Nike Shoes",
        price: Price(current: CurrentPrice(value: 10.0), currency: "USD"),
        imageUrl: "img.png",
        brandName: "Nike"
      )
    )

    XCTAssertEqual(viewModel.favoriteProducts.count, count)
  }
}

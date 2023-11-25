//
//  ProductDetailsTests.swift
//  TrendifyTests
//
//  Created by Mikhail Pak on 2023-11-25.
//

@testable import Trendify
import XCTest

final class ProductDetailsTests: XCTestCase {
  var viewModel: ProductDetailsViewModel?

  override func setUpWithError() throws {
    viewModel = ProductDetailsViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
  }

  @MainActor
  func test_productDetails_notEmpty() async {
    guard let viewModel = viewModel else { return }

    let productsExpectation = expectation(description: "Expect product details to load")
    defer { waitForExpectations(timeout: 2) }

    viewModel.productId = 9851612
    await viewModel.fetchProductDetails()

    productsExpectation.fulfill()

    XCTAssertNotNil(viewModel.productDetails)
  }
}

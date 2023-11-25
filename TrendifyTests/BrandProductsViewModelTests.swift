//
//  BrandProductsViewModelTests.swift
//  TrendifyTests
//
//  Created by Mikhail Pak on 2023-11-25.
//

@testable import Trendify
import XCTest

final class BrandProductsViewModelTests: XCTestCase {
  var viewModel: BrandProductsViewModel?

  override func setUpWithError() throws {
    viewModel = BrandProductsViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
  }

  @MainActor
  func test_products_notEmpty() async {
    guard let viewModel = viewModel else { return }

    let productsExpectation = expectation(description: "Expect brand products to load")
    defer { waitForExpectations(timeout: 2) }

    await viewModel.fetchProducts(categoryId: 4209)

    productsExpectation.fulfill()

    guard let products = viewModel.products else { return }

    XCTAssertTrue(!products.isEmpty)
  }
}

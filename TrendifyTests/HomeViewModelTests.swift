//
//  TrendifyTests.swift
//  TrendifyTests
//
//  Created by Mikhail Pak on 2023-11-09.
//

@testable import Trendify
import XCTest

final class HomeViewModelTests: XCTestCase {
  var viewModel: HomeViewModel?

  override func setUpWithError() throws {
    viewModel = HomeViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
  }

  @MainActor
  func test_products_notEmpty() async {
    guard let viewModel = viewModel else { return }

    let productsExpectation = expectation(description: "Expect products to load")
    defer { waitForExpectations(timeout: 2) }

    await viewModel.fetchProducts()

    productsExpectation.fulfill()

    guard let products = viewModel.products else { return }

    XCTAssertTrue(!products.isEmpty)
  }

  @MainActor
  func test_brands_notEmpty() async {
    guard let viewModel = viewModel else { return }

    let brandsExpectation = expectation(description: "Expect brands to load")
    defer { waitForExpectations(timeout: 2) }

    await viewModel.fetchBrands()

    brandsExpectation.fulfill()

    guard let brands = viewModel.brands else { return }

    XCTAssertTrue(!brands.isEmpty)
  }

  @MainActor
  func test_productsByBrand_notEmpty() async {
    guard let viewModel = viewModel else { return }

    let brandsExpectation = expectation(description: "Expect products by brand to load")
    defer { waitForExpectations(timeout: 2) }

    await viewModel.fetchBrands()
    await viewModel.fetchProductsByBrand(brandName: "nike")

    brandsExpectation.fulfill()

    guard let products = viewModel.products else { return }

    XCTAssertTrue(!products.isEmpty)
  }
}

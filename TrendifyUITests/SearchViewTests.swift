//
//  ProductDetailsTests.swift
//  TrendifyUITests
//
//  Created by Mikhail Pak on 2023-11-25.
//

import XCTest

final class SearchViewTests: XCTestCase {
  let app = XCUIApplication()

  override func setUpWithError() throws {
    app.launch()
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {}

  func testSearchBrands() throws {
    app.images["search-icon"].tap()

    let productsList = app.scrollViews.otherElements.otherElements["ProductsSearchList"]
    if productsList.waitForExistence(timeout: 3) {
      let button = productsList.buttons.element(boundBy: 0)
      button.tap()

      let brandProductsGrid = app.scrollViews.otherElements.otherElements["ProductsByBrandsList"]
      if brandProductsGrid.waitForExistence(timeout: 3) {
        XCTAssertTrue(brandProductsGrid.exists)
      }

      brandProductsGrid.buttons.element(boundBy: 0).tap()

      let productDetails = app.staticTexts["Product Details"]
      if productDetails.waitForExistence(timeout: 2) {
        let addToCart = app.buttons["Add to cart"]
        XCTAssertTrue(productDetails.exists)
        XCTAssertTrue(addToCart.exists)
      }
    }
  }
}

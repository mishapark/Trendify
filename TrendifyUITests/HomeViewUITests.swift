//
//  HomeViewUITests.swift
//  TrendifyUITests
//
//  Created by Mikhail Pak on 2023-11-25.
//

import XCTest

final class HomeViewUITests: XCTestCase {
  let app = XCUIApplication()

  override func setUpWithError() throws {
    app.launch()
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {}

  func testBrandButton() throws {
    let nikeImage = app.images["nike"]
    nikeImage.tap()

    let product = app.staticTexts["Nike"]
    XCTAssertTrue(product.exists)
  }

  func testProductLink() throws {
    let productsGrid = app.scrollViews.otherElements.otherElements["ProductsGrid"]
    if productsGrid.waitForExistence(timeout: 5) {
      XCTAssertTrue(productsGrid.exists)
    }

    XCTAssertTrue(productsGrid.buttons.element.exists)
    productsGrid.buttons.element(boundBy: 0).tap()

    let productDetails = app.staticTexts["Product Details"]
    let addToCart = app.buttons["Add to cart"]
    XCTAssertTrue(productDetails.exists)
    XCTAssertTrue(addToCart.exists)
  }

  func testProfileTab() throws {
    app.images["profile-icon"].tap()
    XCTAssertTrue(app.staticTexts["Profile"].exists)
  }
}

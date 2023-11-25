//
//  CartViewTests.swift
//  TrendifyUITests
//
//  Created by Mikhail Pak on 2023-11-25.
//

import XCTest

final class CartViewTests: XCTestCase {
  let app = XCUIApplication()

  override func setUpWithError() throws {
    app.launch()
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {}

  func testAddToCart() throws {
    let productsGrid = app.scrollViews.otherElements.otherElements["ProductsGrid"]
    if productsGrid.waitForExistence(timeout: 3) {
      XCTAssertTrue(productsGrid.exists)
    }

    XCTAssertTrue(productsGrid.buttons.element.exists)
    productsGrid.buttons.element(boundBy: 0).tap()

    let scrollViewsQuery = app.scrollViews.element(boundBy: 0)
    XCTAssertTrue(scrollViewsQuery.exists)
    scrollViewsQuery.swipeUp()

    let sizeButton = scrollViewsQuery.otherElements["SizesGrid"].buttons.element(boundBy: 0)
    XCTAssertTrue(sizeButton.exists)

    sizeButton.tap()

    let addToCart = app.buttons["Add to cart"]
    XCTAssertTrue(addToCart.exists)

    addToCart.tap()

    let goToCartButton = app.buttons["GO TO CART"]
    XCTAssertTrue(goToCartButton.exists)

    goToCartButton.tap()

    let subtotalText = app.staticTexts["Payment Amount"]
    XCTAssertTrue(subtotalText.exists)

    let checkoutButton = app.buttons["CHECKOUT"]
    XCTAssertTrue(checkoutButton.exists)

    checkoutButton.tap()

    app.buttons["CHECKOUT"].tap()
    app.buttons["OK"].tap()

    XCTAssertTrue(app.staticTexts["Cart is empty"].exists)
  }
}

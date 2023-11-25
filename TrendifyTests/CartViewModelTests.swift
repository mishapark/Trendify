//
//  CartViewModelTests.swift
//  TrendifyTests
//
//  Created by Mikhail Pak on 2023-11-25.
//

@testable import Trendify
import XCTest

final class CartViewModelTests: XCTestCase {
  var viewModel: CartViewModel?

  override func setUpWithError() throws {
    viewModel = CartViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
  }

  func test_addToCart() {
    guard let viewModel = viewModel else { return }

    viewModel.addToCart(productDetails: ProductDetails.products[0], quantity: 1, size: "US 8")

    XCTAssertTrue(viewModel.items.contains { cartItem in
      cartItem.productDetails.id == ProductDetails.products[0].id
    })
  }

  func test_deleteFromCart() {
    guard let viewModel = viewModel else { return }

    let cartItem = CartItem(productDetails: ProductDetails.products[0], size: "US 8", count: 1)

    viewModel.items.append(cartItem)

    XCTAssertTrue(viewModel.items.contains { item in
      item.id == cartItem.id
    })

    viewModel.removeCartItem(item: cartItem)

    XCTAssertFalse(viewModel.items.contains { item in
      item.id == cartItem.id
    })
  }

  func test_Amounts() {
    guard let viewModel = viewModel else { return }

    let cartItem = CartItem(productDetails: ProductDetails.products[0], size: "US 8", count: 1)
    let cartItem1 = CartItem(productDetails: ProductDetails.products[1], size: "US 9", count: 2)

    viewModel.items.append(cartItem)
    viewModel.items.append(cartItem1)

    let totalQuantity = viewModel.items.reduce(0) { acc, product in
      acc + product.count
    }

    XCTAssertEqual(viewModel.totalItemsQuantity, totalQuantity)

    let subTotal = viewModel.items.reduce(0.0) { acc, cartItem in
      acc + cartItem.productDetails.price.current.value * Double(cartItem.count)
    }

    XCTAssertEqual(viewModel.subTotalAmount, subTotal)

    XCTAssertEqual(viewModel.subTotalAmount * viewModel.taxRate, viewModel.taxAmount)

    XCTAssertEqual(viewModel.isPromoCodeApplied, viewModel.promoCode == "trendify10".uppercased())

    viewModel.promoCode = "trendify10".uppercased()
    XCTAssertEqual(viewModel.promoDiscount, subTotal * 0.10)

    XCTAssertEqual(
      viewModel.totalAmount,
      subTotal +
        viewModel.subTotalAmount * viewModel.taxRate +
        viewModel.shippingFee -
        viewModel.promoDiscount
    )
  }
}

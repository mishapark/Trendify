//
//  CartVieModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-14.
//

import Foundation

struct CartItem: Identifiable, Codable {
  var id = UUID()
  var productDetails: ProductDetails
  var size: String
  var count: Int
}

class CartViewModel: ObservableObject {
  @Published var items: [CartItem] = [] {
    didSet {
      saveItems()
    }
  }
  @Published var promoCode = ""

  init() {
    getItems()
  }


  // MARK: - Amount calculations
  var totalItemsQuantity: Int {
    items.reduce(0) { acc, product in
      acc + product.count
    }
  }
  let shippingFee = 20.0
  let taxRate = 0.13
  var subTotalAmount: Double {
    items.reduce(0.0) { acc, product in
      acc + product.productDetails.price.current.value * Double(product.count)
    }
  }
  var taxAmount: Double {
    subTotalAmount * taxRate
  }
  var isPromoCodeApplied: Bool {
    promoCode == "trendify10".uppercased()
  }
  var promoDiscount: Double {
    isPromoCodeApplied ? subTotalAmount * 0.10 : 0
  }
  var totalAmount: Double {
    subTotalAmount + taxAmount + shippingFee - promoDiscount
  }

  // MARK: - Cart functions
  func removeCartItem(item: CartItem) {
    items.removeAll { itemInCart in
      itemInCart.id == item.id
    }
  }
  func addToCart(productDetails: ProductDetails, quantity: Int, size: String) {
    if let productInCart = items.firstIndex(where: { product in
      productDetails.id == product.productDetails.id && product.size == size
    }) {
      items[productInCart].count += quantity
    } else {
      items.append(CartItem(productDetails: productDetails, size: size, count: quantity))
    }
  }
  func getItems() {
    guard
      let data = UserDefaults.standard.data(forKey: PreferencesKeys.cartItems.rawValue),
      let savedItems = try? JSONDecoder().decode([CartItem].self, from: data)
    else { return }

    items = savedItems
  }
  func saveItems() {
    if let encodedData = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(encodedData, forKey: PreferencesKeys.cartItems.rawValue)
    }
  }
}

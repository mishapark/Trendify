//
//  ProfileViewModel.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-19.
//

import Foundation
import PhotosUI
import SwiftUI

enum PreferencesKeys: String {
  case cartItems
  case favoriteProducts
  case profilePicture
  case isDarkMode
}

class ProfileViewModel: ObservableObject {
  @Published var isDarkMode = false {
    didSet {
      toggleDarkMode()
    }
  }

  @Published var favoriteProducts: [Product] = [] {
    didSet {
      saveProducts()
    }
  }

  @Published var postImage: Image?
  @Published var selectedImage: PhotosPickerItem? {
    didSet {
      Task {
        await self.loadImage(fromItem: self.selectedImage)
      }
    }
  }

  init() {
    getProducts()
    getProfileImage()
    isDarkMode = darkMode()
  }

  // MARK: - Profile Image

  func loadImage(fromItem item: PhotosPickerItem?) async {
    guard let item = item else { return }
    guard let data = try? await item.loadTransferable(type: Data.self) else { return }
    UserDefaults.standard.set(data, forKey: PreferencesKeys.profilePicture.rawValue)
    guard let uiImage = UIImage(data: data) else { return }

    await MainActor.run {
      self.postImage = Image(uiImage: uiImage)
    }
  }

  func getProfileImage() {
    guard let data = UserDefaults.standard.data(forKey: PreferencesKeys.profilePicture.rawValue) else { return }
    guard let uiImage = UIImage(data: data) else { return }
    postImage = Image(uiImage: uiImage)
  }

  func saveProfileImage() {
    postImage = nil
    UserDefaults.standard.removeObject(forKey: PreferencesKeys.profilePicture.rawValue)
  }

  // MARK: - Dark Mode

  func toggleDarkMode() {
    UserDefaults.standard.set(isDarkMode, forKey: PreferencesKeys.isDarkMode.rawValue)
  }

  func darkMode() -> Bool {
    UserDefaults.standard.bool(forKey: PreferencesKeys.isDarkMode.rawValue)
  }

  // MARK: - Favorites

  func getProducts() {
    guard
      let data = UserDefaults.standard.data(forKey: PreferencesKeys.favoriteProducts.rawValue),
      let savedProducts = try? JSONDecoder().decode([Product].self, from: data)
    else { return }

    favoriteProducts = savedProducts
  }

  func addOrDeleteProduct(product: Product) {
    if favoriteProducts.contains(where: { $0.id == product.id }) {
      favoriteProducts.removeAll { $0.id == product.id }
    } else {
      favoriteProducts.append(product)
    }
  }

  func saveProducts() {
    if let encodedData = try? JSONEncoder().encode(favoriteProducts) {
      UserDefaults.standard.set(encodedData, forKey: PreferencesKeys.favoriteProducts.rawValue)
    }
  }
}

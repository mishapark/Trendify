//
//  APIService.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import Foundation

class APIService {
  static let shared = APIService()

  private var apiKey: String {
    guard let filePath = Bundle.main.path(forResource: "ASOS-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'TMDB-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "X-RapidAPI-Key") as? String else {
      fatalError("Couldn't find key 'X-RapidAPI-Key' in 'ASOS-Info.plist'.")
    }
    return value
  }

  func fetchFromAPI(url: String) async throws -> Data {
    let headers = [
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "asos2.p.rapidapi.com"
    ]
    do {
      guard let url = URL(string: url) else {
        throw APIError.badUrl
      }

      var request = URLRequest(url: url)
      request.allHTTPHeaderFields = headers

      let (data, response) = try await URLSession.shared.data(for: request)

      guard let response = response as? HTTPURLResponse else {
        throw APIError.badResponse
      }

      guard (200 ..< 300).contains(response.statusCode) else {
        throw APIError.badStatus
      }

      return data
    } catch {
      throw error
    }
  }
}

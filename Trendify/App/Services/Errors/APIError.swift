//
//  Errors.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-10.
//

import Foundation

enum APIError: Error {
  case badUrl
  case badResponse
  case badStatus
  case failedToDecode
}

extension APIError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .badUrl:
      return "Bad URL: use a different URL"
    case .badResponse:
      return "Bad Response: received bad response"
    case .badStatus:
      return "Bad Status: status code is not 200"
    case .failedToDecode:
      return "Failed to decode JSON"
    }
  }
}

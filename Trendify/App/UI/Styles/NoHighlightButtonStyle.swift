//
//  NoHighlightButtonStyle.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-11.
//

import Foundation
import SwiftUI

struct NoHighlightButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label.foregroundColor(.accentColor)
  }
}

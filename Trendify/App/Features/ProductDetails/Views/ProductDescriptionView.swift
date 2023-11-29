//
//  ProductDescriptionView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-12.
//

import SwiftUI

struct ProductDescriptionView: View {
  let text: String

  @State var isExpanded = false
  @State var convertedText: String = ""

  var body: some View {
    VStack(alignment: .leading) {
      RegularText(convertedText, color: Colors.General.AccentColor)
        .lineLimit(isExpanded ? nil : 1)
        .padding(.bottom, 3)
      HStack {
        Spacer()
        Button {
          withAnimation {
            isExpanded.toggle()
          }
        } label: {
          Text(isExpanded ? "Read less" : "Read more")
            .foregroundStyle(Colors.General.DarkTextColor)
            .font(.custom(OrbitronFonts.bold, size: Constants.Text.text))
        }
      }
      .frame(maxWidth: .infinity)
    }
    .onAppear {
      convertedText = convertHTMLToPlainText(text)
    }
  }
}

private func convertHTMLToPlainText(_ text: String) -> String {
  guard let data = text.data(using: .utf8) else {
    return "Failed to load the text"
  }

  let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
    .documentType: NSAttributedString.DocumentType.html,
    .characterEncoding: String.Encoding.utf8.rawValue
  ]

  do {
    let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
    return attributedString.string
  } catch {
    print("Something broke: (error)")
    return "Failed to load the text"
  }
}

#Preview {
  ProductDescriptionView(text: """
  Super cool shoes that you will every day everywhere. Don't wait and buy these shoes.
  Super cool shoes that you will every day everywhere. Don't wait and buy these shoes
  """)
}

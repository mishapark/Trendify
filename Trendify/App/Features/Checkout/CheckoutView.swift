//
//  CheckoutVIew.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-14.
//

import SwiftUI

enum AddressFocusedFields {
  case firstName, lastName, address, city, postalCode
}

struct CheckoutView: View {
  @EnvironmentObject var settings: ContentViewModel
  @EnvironmentObject var cart: CartViewModel

  @Environment(\.dismiss)
  var dismiss

  @State var isAlertPresented = false

  @FocusState var focusedField: AddressFocusedFields?

  @State var firstName: String = ""
  @State var lastName: String = ""
  @State var address: String = ""
  @State var city: String = ""
  @State var postalCode: String = ""

  var body: some View {
    ZStack {
      ScrollView {
        VStack(spacing: Constants.General.smallSectionSpacing) {
          MediumTitle("Address")
          VStack(spacing: Constants.General.smallSectionSpacing) {
            HStack {
              CustomTextField(text: $firstName, placeholder: "First Name", isFocused: focusedField == .firstName)
                .focused($focusedField, equals: .firstName)
              CustomTextField(text: $lastName, placeholder: "Last Name", isFocused: focusedField == .lastName)
                .focused($focusedField, equals: .lastName)
            }
            ZStack(alignment: .topLeading) {
              TextEditor(text: $address)
                .focused($focusedField, equals: .address)
                .disableAutocorrection(true)
                .font(.custom(OrbitronFonts.bold, size: Constants.Text.subtitle))
                .padding(7)
                .frame(height: 100)
                .background(Colors.General.LightTextColor)
                .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
                .overlay {
                  RoundedRectangle(cornerRadius: Constants.Card.cornerRadius).stroke(Colors.General.DarkTextColor)
                }
                .overlay {
                  RoundedRectangle(cornerRadius: 10).stroke(focusedField == .address ? .orange : .clear, lineWidth: 2)
                }

              if address.isEmpty && focusedField != .address {
                Subtitle("Address")
                  .opacity(0.3)
                  .font(.custom(OrbitronFonts.bold, size: Constants.Text.subtitle))
                  .padding(7)
              }
            }
            HStack {
              CustomTextField(text: $city, placeholder: "City", isFocused: focusedField == .city)
                .focused($focusedField, equals: .city)
              CustomTextField(text: $postalCode, placeholder: "Postal Code", isFocused: focusedField == .postalCode)
                .focused($focusedField, equals: .postalCode)
            }
          }
          .padding()
          .background(Colors.General.LightAccentColor)
          .clipShape(RoundedRectangle(cornerRadius: Constants.Card.cornerRadius))
          .padding(.horizontal)
          .padding(.bottom, 20)
          MediumTitle("Card Details")
          CreditCardView()
            .padding(.horizontal)

          Spacer()
          HStack {
            LargeTitle("Total:")
            Spacer()
            LargeTitle(String(format: "$%.2f", cart.totalAmount))
          }
          .padding(.bottom, 20)
          .padding(.horizontal)
        }
        .padding(.top, Constants.General.pageTopPadding)
        .padding(.bottom, Constants.General.pageBottomPadding)
      }
      .scrollIndicators(.hidden)
      .background(Colors.General.BackgroundColor)
      .toolbar(.hidden)
      .onAppear {
        withAnimation {
          settings.isTabViewVisible = false
        }
      }
      .overlay {
        CustomNavigationBar(title: "Checkout", leadingIcon: "chevron.left") {
          dismiss()
        }
        BottomContainerView {
          Button {
            withAnimation {
              isAlertPresented = true
            }
          } label: {
            AccentTextButton(text: "Checkout", size: .big)
          }
          .padding()
        }
      }

      if isAlertPresented {
        CustomAlertView(
          title: "Your order is on the way!",
          message: "We are processing your order. Please check your email for updates",
          primaryButtonLabel: "Ok"
        ) {
          cart.items = []
          dismiss()
          isAlertPresented = false
        }
      }
    }
  }
}

#Preview {
  CheckoutView()
    .environmentObject(ContentViewModel())
    .environmentObject(CartViewModel())
}

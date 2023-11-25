//
//  ProfileView.swift
//  Trendify
//
//  Created by Mikhail Pak on 2023-11-19.
//

import PhotosUI
import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var profile: ProfileViewModel

  @State private var imagePickerPresented = false
  @State var isAlertPresented = false

  var body: some View {
    ZStack {
      ScrollView {
        VStack {
          Button {
            withAnimation {
              isAlertPresented = true
            }
          } label: {
            if let image = profile.postImage {
              image
                .resizable()
                .scaledToFill()
            } else {
              Image(systemName: "plus")
                .resizable()
                .padding(40)
                .foregroundStyle(.white)
                .scaledToFill()
                .background(.black)
                .opacity(0.8)
            }
          }
          .clipShape(Circle())
          .frame(width: 100, height: 100)
          .padding(.vertical, 20)
          HStack {
            SmallTitle("Dark Mode")
            Spacer()
            Button {
              profile.isDarkMode.toggle()
            } label: {
              ColoredCircleButton(
                icon: profile.isDarkMode ? "moon.fill" : "sun.max.fill",
                color: profile.isDarkMode ? .blue : .yellow,
                size: 20
              )
            }
          }
          Divider()
            .frame(height: 1)
            .overlay(Colors.General.DarkTextColor)
            .padding(.vertical, 5)
          NavigationLink(value: NavigationPaths.favorites) {
            HStack {
              SmallTitle("My Favorites")
              Spacer()
              ColoredCircleButton(icon: "heart.fill", color: .red, size: 20)
            }
          }

          Spacer()
        }
        .padding(.horizontal)
        .padding(.top, Constants.General.pageTopPadding)
      }
      .scrollIndicators(.hidden)
      .background(Colors.General.BackgroundColor)
      .overlay {
        CustomNavigationBar(title: "Profile")
      }

      if isAlertPresented {
        CustomAlertView(primaryButtonLabel: "Change photo", secondaryButtonLabel: "Delete photo") {
          imagePickerPresented.toggle()
          isAlertPresented.toggle()
        } secondaryButtonAction: {
          profile.saveProfileImage()
          isAlertPresented.toggle()
        } tapOutside: {
          isAlertPresented = false
        }
      }
    }

    .photosPicker(isPresented: $imagePickerPresented, selection: $profile.selectedImage)
  }
}

#Preview {
  ProfileView()
    .environmentObject(ProfileViewModel())
}

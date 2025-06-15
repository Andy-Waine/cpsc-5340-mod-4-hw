//
//  WelcomeView.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//

import SwiftUI

struct WelcomeView: View {
  @ObservedObject var viewModel: AuthViewModel
  @Binding var toggleSignUp: Bool

  var body: some View {
    VStack(spacing: 20) {
      Text("Welcome")
        .font(.largeTitle)
        .bold()

      Spacer()

      Text("""
        Welcome! You've been authenticated successfully.
        This will be the landing page for the final project.
        """)
        .multilineTextAlignment(.center)
        .font(.title2)
        .padding()

      Button("Logout") {
        viewModel.signOut()
        toggleSignUp = false
      }
      .buttonStyle(.borderedProminent)
      .tint(.red)

      Spacer()
    }
    .padding()
  }
}

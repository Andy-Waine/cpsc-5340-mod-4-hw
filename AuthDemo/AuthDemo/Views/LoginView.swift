//
//  LoginView.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject var viewModel: AuthViewModel
  @Binding var toggleSignUp: Bool

  var body: some View {
    VStack(spacing: 20) {
      Text("Login")
        .font(.largeTitle)
        .bold()

      TextField("Email", text: $viewModel.email)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      SecureField("Password", text: $viewModel.password)
        .textContentType(nil)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      if let error = viewModel.errorMessage {
        Text(error)
          .foregroundColor(.red)
      }

      Button("Sign In") {
        viewModel.signIn()
      }
      .buttonStyle(.borderedProminent)

      Button("Don't have an account? Sign Up") {
        toggleSignUp = true
      }
      .buttonStyle(.bordered)
    }
    .padding()
  }
}


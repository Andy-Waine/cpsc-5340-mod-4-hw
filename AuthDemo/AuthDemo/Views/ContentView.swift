//
//  ContentView.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = AuthViewModel()
  @State private var isSignUp = false

  var body: some View {
    Group {
      if viewModel.isAuthenticated {
        WelcomeView(viewModel: viewModel, toggleSignUp: $isSignUp)
      } else if isSignUp {
        SignUpView(viewModel: viewModel, toggleSignUp: $isSignUp)
      } else {
        LoginView(viewModel: viewModel, toggleSignUp: $isSignUp)
      }
    }
    .onChange(of: viewModel.didSignUp) { if $0 { isSignUp = false; viewModel.didSignUp = false } }
  }
}





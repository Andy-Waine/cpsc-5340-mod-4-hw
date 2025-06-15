//
//  AuthViewModel.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var isAuthenticated = false
  @Published var didSignUp = false
  @Published var errorMessage: String?

  private let authService = AuthenticationService()

  func signIn() {
    errorMessage = nil
    authService.signIn(email: email, password: password) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success:
          self?.isAuthenticated = true

        case .failure(let error):
          let ns = error as NSError
          let badCredentialsCodes: [Int] = [
            AuthErrorCode.wrongPassword.rawValue,
            AuthErrorCode.userNotFound.rawValue,
            AuthErrorCode.invalidCredential.rawValue,
            AuthErrorCode.invalidEmail.rawValue
          ]

          if ns.domain == AuthErrorDomain && badCredentialsCodes.contains(ns.code) {
            self?.errorMessage = "Invalid email or password."
          } else {
            self?.errorMessage = error.localizedDescription
          }
        }
      }
    }
  }

  func signUp() {
    errorMessage = nil
    authService.signUp(email: email, password: password) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success:
          self?.didSignUp = true
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        }
      }
    }
  }

  func signOut() {
    errorMessage = nil
    authService.signOut { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success:
          self?.isAuthenticated = false
          self?.email = ""
          self?.password = ""
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        }
      }
    }
  }
}



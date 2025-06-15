//
//  AuthenticationService.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//
import Foundation
import FirebaseAuth

// Handles Firebase authentication calls
class AuthenticationService {
  func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if let user = authResult?.user {
        completion(.success(user))
      } else if let error = error {
        completion(.failure(error))
      }
    }
  }
}

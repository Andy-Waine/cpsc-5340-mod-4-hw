//
//  AuthDemoApp.swift
//  AuthDemo
//
//  Created by Andy Waine on 6/15/25.
//

import SwiftUI
import FirebaseCore

@main
struct AuthDemoApp: App {
  init() {
    FirebaseApp.configure()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}


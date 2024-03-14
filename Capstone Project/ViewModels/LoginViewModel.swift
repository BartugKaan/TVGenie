//
//  LoginViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 13.03.2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var errorMessage = ""
  
  init() {
    
  }
  
  func login() {
    guard validate() else {
      return
    }
    Auth.auth().signIn(withEmail: email, password: password){_,error in
      if error != nil {
        self.errorMessage = "Login failed"
      }
    }
  }
  
  func validate() -> Bool {
    errorMessage = ""
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Please fill all of the fields"
      return false
    }
    guard email.contains("@") && email.contains(".") else {
      errorMessage = "Please enter a valid email address"
      return false
    }
    return true
  }
  
  
}

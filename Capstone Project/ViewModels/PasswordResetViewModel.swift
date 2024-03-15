//
//  PasswordResetViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class PasswordResetViewModel: ObservableObject {
  @Published var email = ""
  @Published var errorMessage = ""
  @Published var hasError = false
  
  init() {
    
  }
  
  func resetPassword(email: String) {
    Auth.auth().sendPasswordReset(withEmail: email) { error in
      if error?.localizedDescription != nil{
        self.hasError = true
        self.errorMessage = error.debugDescription
      }
      
    }
  }
  
}

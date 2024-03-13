//
//  RegisterViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 13.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
  @Published var name = ""
  @Published var email = ""
  @Published var password = ""
  @Published var errorMessage = ""
  
  init() {
    
  }
  
  func register() {
    guard validate() else {
      return
    }
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      guard let userId = result?.user.uid else{
        return
      }
      // Insert Metodu çağıralacak
      self?.inserUserRecord(id: userId)
    }
  }
  
  private func inserUserRecord(id: String){
    let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
    let db = Firestore.firestore()
    db.collection("users")
      .document(id)
      .setData(newUser.asDictionary())
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !name.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Please fill all of the fields"
      return false
    }
    guard email.contains("@") && email.contains(".") else {
      errorMessage = "Please enter a valid email"
      return false
    }
    guard password.count >= 6 else {
      errorMessage = "Please create a password with 6 or more characters"
      return false
    }
    
    return true
  }
  
}

//
//  MainViewModel.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
  @Published var currentUserId: String = ""
  
  init() {
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""
      }
    }
  }
  
  public var isSignedIn: Bool{
    return Auth.auth().currentUser != nil
  }
  
}

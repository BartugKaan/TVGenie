//
//  Capstone_ProjectApp.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI
import FirebaseCore
@main
struct Capstone_ProjectApp: App {
  
  init(){
    FirebaseApp.configure()
  }
  
  
  var body: some Scene {
    WindowGroup {
      MainView()
    }
  }
}

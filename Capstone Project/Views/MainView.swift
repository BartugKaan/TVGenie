//
//  MainView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewModel()
    var body: some View {
      
      if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
         //AppPage Screen View
        accountView
      } else{
        OnboardingView()
      }
    }
}

#Preview {
    MainView()
}

@ViewBuilder
var accountView: some View{
  TabView{
    ProductListView()
      .tabItem {
        Label("Home", systemImage: "house")
      }
    PhotoView()
      .tabItem {
        Label("Camera", systemImage: "camera.fill")
      }
    ProfileView()
      .tabItem {
        Label("Profile", systemImage: "person.circle")
      }
    
  }
}

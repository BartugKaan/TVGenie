//
//  ProfileView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import SwiftUI
import SplineRuntime

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        
        if let user = viewModel.user{
          profile(user: user)
        } else {
          VStack {
            Text("Profile loading...")
              .font(.title)
              .fontWeight(.bold)
            
            ProgressView()
              .padding(.bottom, 25)
          }
          .padding(.top, 30)
          Spacer()
        }
        BigButton(title: "Sign-out") {
          viewModel.logout()
        }
        .padding(.bottom, 10)
      }
      .navigationTitle("Profile")
    }
    .onAppear{
      viewModel.fetchUser()
    }
  }
}

#Preview {
  ProfileView()
}

@ViewBuilder
func profile(user: User) -> some View{
    VStack{
    HStack {
      Text("User Name :")
        .font(.title2)
      Text(user.name)
    }
    .padding(.all, 10)
    HStack {
      Text("Email :")
        .font(.title2)
      Text(user.email)
    }
    .padding(.all, 10)
    HStack {
      Text("Joined Date :")
        .font(.title2)
      Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
    }
    .padding(.all, 10)
  }
  Spacer()
}

struct ProfileImageView: View {
  var body: some View {
    // fetching from cloud
    // let url = URL(string: "https://build.spline.design/UN6GDwWbZhVb429-EjT5/scene.splineswift")!

    // // fetching from local
    let url = Bundle.main.url(forResource: "avatar_copy", withExtension: "splineswift")!

    try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
  }
}

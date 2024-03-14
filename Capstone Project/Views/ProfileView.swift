//
//  ProfileView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import SwiftUI

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
  Image(systemName: "person.circle")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .foregroundStyle(.lightDark)
    .frame(width: 125,height: 125)
    .padding(.all, 30)
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

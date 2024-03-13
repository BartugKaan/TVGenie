//
//  LoginView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = LoginViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        VStack{
          Logo()
            .padding(.vertical, 50)
          Form{
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
          }
          .frame(height: 150)
          .scrollDisabled(true)
          BigButton(title: "Sign-In") {
            viewModel.login()
          }
          .padding(.top,25)
          if !viewModel.errorMessage.isEmpty{
            Text(viewModel.errorMessage)
              .foregroundStyle(.red)
          }
          Spacer()
        }
        VStack {
          Text("Are you new here?")
          NavigationLink("Create a new Account") {
            RegisterView()
          }
          .padding(.bottom,20)
        }
      }
      .background(Color(.systemBackground))
    }
  }
}

#Preview {
  LoginView()
}

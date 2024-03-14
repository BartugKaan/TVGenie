//
//  RegisterView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewModel()
  
    var body: some View {
      VStack{
        Logo()
          .padding(.vertical, 50)
        Form{
          Section{
            TextField("Full name", text: $viewModel.name)
              .autocorrectionDisabled()
            TextField("Email", text: $viewModel.email)
              .autocorrectionDisabled()
              .textInputAutocapitalization(.never)
            SecureField("Password", text: $viewModel.password)
          } header: {
            Text("Register Form")
          }
        }
        .frame(height: 200)
        .scrollDisabled(true)
        
        BigButton(title: "Sign-up") {
          viewModel.register()
        }
        if !viewModel.errorMessage.isEmpty{
          Text(viewModel.errorMessage)
            .foregroundStyle(.red)
        }
        Spacer()
      }
      .background(Color(.systemBackground))
    }
}

#Preview {
    RegisterView()
}

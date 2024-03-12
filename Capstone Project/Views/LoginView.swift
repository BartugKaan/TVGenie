//
//  LoginView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct LoginView: View {
  @State var email: String = ""
  @State var password: String = ""
  var body: some View {
    VStack{
      Logo()
        .padding(.vertical, 50)
      Form{
        TextField("Email", text: $email)
        TextField("Password", text: $password)
      }
      .frame(height: 150)
      .scrollDisabled(true)
      
      
      BigButton(title: "Sign-In") {
        
      }
      .padding(.top,25)
      Spacer()
    }
    .background(Color(UIColor(resource: .white)))
  }
}

#Preview {
  LoginView()
}

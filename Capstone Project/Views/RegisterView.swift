//
//  RegisterView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct RegisterView: View {
  @State var username: String = ""
  @State var email: String = ""
  @State var password: String = ""
  
    var body: some View {
      VStack{
        Logo()
          .padding(.vertical, 50)
        Form{
          Section{
            TextField("Full name", text: $username)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
          } header: {
            Text("Register Form")
          }
        }
        .frame(height: 200)
        .scrollDisabled(true)
        
        BigButton(title: "Sign-up") {
          
        }
        Spacer()
      }
      .background(Color(UIColor(resource: .white)))
    }
}

#Preview {
    RegisterView()
}

//
//  PasswordResetView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import SwiftUI

struct PasswordResetView: View {
  @State var email = ""
  var body: some View {
    NavigationStack{
      VStack{
        Text("Password Reset")
          .font(.title)
          .fontWeight(.bold)
          .padding(.vertical, 50)
        Text("Please enter your mail")
          .font(.subheadline)
          .padding(.bottom, 10)
        
        TextField("Email",text: $email)
          .frame(height: 50)
          .padding(.horizontal, 30)
          .font(.title)
          .overlay(
                  RoundedRectangle(cornerRadius: 14)
                    .stroke(Color(UIColor.tertiaryLabel), lineWidth: 2)
                    .padding(.horizontal,15)
              )
        BigButton(title: "Send Link", action: {
          
        })
        .padding(.top, 20)
        
        Spacer()
        
      }
    }
  }
}

#Preview {
  PasswordResetView()
}

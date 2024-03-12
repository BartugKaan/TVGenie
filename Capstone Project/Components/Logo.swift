//
//  Logo.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct Logo: View {
    var body: some View {
      ZStack{
        GradiantBackground()
          .cornerRadius(15)
        Image(.logo)
          .resizable()
          .frame(width: 200,height: 200)
          .shadow(radius: 10)
      }
    }
}

#Preview {
    Logo()
}

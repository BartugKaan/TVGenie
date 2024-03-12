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
          .frame(width: 200,height: 200)
        HStack {
          Text("TV Genie")
            .font(.largeTitle)
            .bold()
          .foregroundStyle(.white)
          
          Image(.logo)
            .resizable()
            .frame(width: 75,height: 75)
            .shadow(radius: 10)
        }
          
      }
    }
}

#Preview {
    Logo()
}

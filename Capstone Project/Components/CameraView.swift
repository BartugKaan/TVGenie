//
//  CameraView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 15.03.2024.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
      HStack{
        Text("Search Products with Photo")
          .padding(.trailing, 10)
        Spacer()
        ZStack
        {
          Rectangle()
            .frame(width: 50,height: 40)
            .cornerRadius(20)
            .foregroundStyle(LinearGradient(colors: [.indigo,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
          Button(action: {}, label: {
            Image(systemName: "camera.fill")
              .foregroundStyle(Color.white)
          })
        }
      }
    }
}

#Preview {
    CameraView()
}

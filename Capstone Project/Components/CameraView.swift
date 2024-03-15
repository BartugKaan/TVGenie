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
        Text("Search products with camera:")
          .padding(.trailing, 10)
          .font(.title2)
        Spacer()
        ZStack
        {
          Rectangle()
            .frame(width: 50,height: 40)
            .cornerRadius(20)
            .foregroundStyle(LinearGradient(colors: [.indigo,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
          NavigationLink {
            PhotoView()
          } label: {
            Image(systemName: "camera.fill")
              .foregroundStyle(.white)
              .font(.title2)
              .padding(.all, 10)
          }

        }
      }
    }
}

#Preview {
    CameraView()
}

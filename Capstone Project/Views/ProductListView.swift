//
//  ProductListView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import SwiftUI

struct ProductListView: View {
  @State var productName: String = ""
  var body: some View {
    NavigationStack{
      VStack{
        CameraView()
        .padding(.horizontal, 20)
        Divider()
          .padding(.horizontal, 30)
        
        Spacer()
      }
      .navigationTitle("TV Genie")
    }
    
  }
}

#Preview {
  ProductListView()
}


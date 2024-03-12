//
//  BigButton.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct BigButton: View {
  let title: String
  let action: () -> Void
  
    var body: some View {
      Button(action: action, label: {
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .foregroundStyle(LinearGradient(colors: [.indigo, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
          Text(title)
            .foregroundStyle(.white)
        }
      })
      .frame(height: 50)
      .padding(.horizontal)
    }
}

#Preview {
  BigButton(title: "String", action: {})
}

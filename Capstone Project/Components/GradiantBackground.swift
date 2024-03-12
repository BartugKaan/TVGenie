//
//  GradiantBackground.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 12.03.2024.
//

import SwiftUI

struct GradiantBackground: View {
  @State private var isAnimateGradient: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .indigo,
              .pink
            ],
            startPoint: isAnimateGradient ?  .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
        )
        .frame(width: 256,height: 256)
        .onAppear{
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimateGradient.toggle()
          }
        }
      MotionAnimationView()
    }
    .frame(width: 256, height: 256)
  }
}

#Preview {
    GradiantBackground()
}

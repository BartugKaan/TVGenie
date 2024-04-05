//
//  OnboardingView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 5.04.2024.
//

import SwiftUI

struct OnboardingView: View {
    var onbImages = [UIImage]()
    @State var currentIndex = 0
    
    init() {
        onbImages.append(.tvGenieOnb1)
        onbImages.append(.tvGenieOnb2)
        onbImages.append(.tvGenieOnb3)
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Tv Genie")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                    Image(uiImage: onbImages[currentIndex])
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 48)
                    
                    Text("Search for the best television you need according to your preferences.")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 36)
                        .multilineTextAlignment(.center)
                        .font(.title3)
                
                HStack(spacing: 16){
                    Circle()
                        .frame(width: 8,height: 8)
                        .onTapGesture {
                            currentIndex = 0
                        }
                        .foregroundStyle(currentIndex == 0 ? .indigo : .pink)
                    Circle()
                        .frame(width: 8,height: 8)
                        .onTapGesture {
                            currentIndex = 1
                        }
                        .foregroundStyle(currentIndex == 1 ? .indigo : .pink)
                    Circle()
                        .frame(width: 8,height: 8)
                        .onTapGesture {
                            currentIndex = 2
                        }
                        .foregroundStyle(currentIndex == 2 ? .indigo : .pink)
                }
                .padding(.bottom, 16)
                
                NavigationLink {
                    RegisterView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 300, height: 65)
                            .foregroundStyle(LinearGradient(colors: [.indigo,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        Text("Discover!")
                            .foregroundStyle(Color.white)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Do you already have an account?")
                }

            }
        }
    }
}

#Preview {
    OnboardingView()
}

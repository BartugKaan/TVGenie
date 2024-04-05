//
//  OnboardingView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 5.04.2024.
//

import SwiftUI

struct OnboardingView: View {
    let images = ["TvGenie-Onb1","TvGenie-Onb2","TvGenie-Onb3"]
    let subTitles = [
        "Find the television you are looking for from our wide range of products in our system.",
        "Search for the televisions that are suitable for your intended use.",
        "Create an account and add your desired product to your favorites."]
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
                
                
                TabView {
                    ForEach(0..<3){ i in
                        VStack {
                            Image("\(images[i])")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 48)
                            Text("\(subTitles[i])")
                                .padding()
                                .font(.title2)
                                .padding(.horizontal, 24)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .background(Color(UIColor.systemIndigo))
                .opacity(0.7)
                .cornerRadius(20)
                .padding()
                
                
                
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

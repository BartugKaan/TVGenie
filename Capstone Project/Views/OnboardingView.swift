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
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                Text("Tv Genie")
                    .font(.system(size: 40, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.all, 0)
                TabView {
                    ForEach(0..<3){ i in
                        ZStack {
                            MotionAnimationView()
                                .background(Rectangle().foregroundColor(.clear).frame(width: 400,height: 400).mask(Rectangle()))
                                
                            Spacer()
                            VStack {
                                Text("\(subTitles[i])")
                                    .padding()
                                    .font(.title2)
                                    .padding(.horizontal, 24)
                                    .multilineTextAlignment(.center)
                                Image("\(images[i])")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                            }
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 500)
                .cornerRadius(30)
                .padding(.top, 0)
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
                    .padding(.top, 8)
                }
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Do you already have an account?")
                        .padding(.top, 16)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}

#Preview {
    OnboardingView()
}

//
//  ProfileView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import SwiftUI
import SplineRuntime

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State var isDeletedPressed = false
    var body: some View {
        NavigationStack {
            VStack {
                
                if let user = viewModel.user{
                    profile(user: user,viewModel: viewModel)
                } else {
                    VStack {
                        Text("Profile loading...")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        ProgressView()
                            .padding(.bottom, 25)
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                Button(action: {
                    isDeletedPressed = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.red)
                        Text("Delete this account")
                            .foregroundStyle(Color.white)
                    }
                })
                .frame(width: 300,height: 50)
                .padding(.bottom, 32)
            }
            .navigationTitle("Profile")
        }
        .alert(isPresented: $isDeletedPressed){
            Alert(title: Text("We will miss you 🙁"), message: Text("You cannot undo this action. Are you sure ?"),  primaryButton: .cancel(Text("Cancel")), secondaryButton: .destructive(Text("Delete"), action: {
                viewModel.deleteAccount()
            }))
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

@ViewBuilder
func profile(user: User, viewModel: ProfileViewModel) -> some View{
    VStack{
        Text(user.name)
            .padding(.all, 10)
            .font(.title)
        Form{
            HStack {
                Text("Email :")
                    .font(.title2)
                Text(user.email)
            }
            .padding(.all, 10)
            HStack {
                Text("Joined Date :")
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
            }
            .padding(.all, 10)
            HStack {
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Sign out")
                        .foregroundStyle(Color.red)
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding()
                })
            }
        }
        .cornerRadius(25)
        .frame(height: 270)
        .padding(.horizontal, 16)
        .scrollDisabled(true)
        
        Spacer()
    }
}

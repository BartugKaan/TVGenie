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
          CustomSearchStack(searchText: productName)
              .padding(.top,16)
          VStack{
              HStack{
                  Text("Brands")
                      .padding(.all, 16)
                      .font(.title3)
                  Spacer()
              }
              BrandButtonsViewGroup()
          }
          Spacer()
      }
      .toolbar{
          ToolbarItem(placement: .principal){
              VStack{
                  Text("Welcome to TV Genie!")
                      .font(.title2)
                      .fontWeight(.semibold)
              }
          }
          ToolbarItem(placement: .topBarTrailing){
              NavigationLink {
                  ProfileView()
              } label: {
                  Image(systemName: "person.circle")
              }
          }
      }
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color.clear, for: .navigationBar)
    }
  }
}

#Preview {
  ProductListView()
}


struct CustomSearchStack: View {
    @State var searchText = ""
    var body: some View {
        HStack(spacing:0){
            TextField("Search",text: $searchText)
                .frame(height: 45)
                .padding(.horizontal, 30)
                .font(.title)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(UIColor.tertiaryLabel), lineWidth: 2)
                        .padding(.horizontal,16)
                )
            Button(action: {
                //TODO: Search Functionility
                print("Test")
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .padding(0)
            })
            .disabled(searchText.isEmpty ? true : false)
            .padding(.trailing, 16)
        }
        .padding(.top,8)
    }
}

struct BrandButtonsViewGroup: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                //TODO: Brandler kadar button olmalı
                BrandButton(backgroundColor: .blue, text: "Vestel")
                BrandButton(backgroundColor: .blue, text: "Beko")
                BrandButton(backgroundColor: .blue, text: "LG")
                BrandButton(backgroundColor: .blue, text: "Sonny")
                BrandButton(backgroundColor: .blue, text: "Samsung")
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
}

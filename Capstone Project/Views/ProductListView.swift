//
//  ProductListView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.03.2024.
//

import SwiftUI

struct ProductListView: View{
    @StateObject var viewModel = ProductListViewModel()
    @State var isLoading = true
    var body: some View {
        NavigationStack{
            VStack{
                CustomSearchStack(viewModel: viewModel)
                    .padding(.top,16)
                VStack{
                    HStack{
                        Text("Filter by")
                            .padding(.all, 16)
                            .font(.title3)
                        Spacer()
                    }
                    FilterButtonView(viewModel: viewModel)
                }
                if isLoading{
                    ProgressView()
                }
                else{
                    VStack{
                        HStack{
                            Text("Televisions sorted by the scores")
                                .padding(.all, 16)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        List{
                            if viewModel.products.isEmpty {
                                HStack(alignment: .center){
                                    Spacer()
                                    Text("We connot found \(viewModel.searchText) product!")
                                    Spacer()
                                }
                            } else {
                                ForEach(viewModel.products, id: \.id){item in
                                    NavigationLink {
                                        ProductDetailView(item: item)
                                    } label: {
                                        TVCellView(name: item.name, brand: item.brand, rank: item.rank,imageUrl: item.imageUrl)
                                    }
                                }
                            }
                        }
                        .listItemTint(.clear)
                        .listRowSpacing(30)
                    }
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
        .onAppear{
            viewModel.setDatabaseQueue()
            viewModel.loadAllData()
            isLoading = false
            print(viewModel.products.count)
        }
    }
}

#Preview {
    ProductListView()
}


struct CustomSearchStack: View {
    @StateObject var viewModel: ProductListViewModel

    var body: some View {
        HStack(spacing: 0) {
            TextField("Search", text: $viewModel.searchText)
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.searchWithText()
                }
                .frame(height: 45)
                .padding(.horizontal, 30)
                .font(.title)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(UIColor.tertiaryLabel), lineWidth: 2)
                        .padding(.horizontal, 16)
                )
                .padding(.trailing, 16)
        }
        .padding(.top, 8)
    }
}

struct FilterButtonView: View {
    @StateObject var viewModel : ProductListViewModel
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                FilterButton(function: {
                    viewModel.loadAllData()
                }, text: "Score")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byCost)
                }, text: "Cost")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byWarranty)
                }, text: "Warranty")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byScreenSize)
                }, text: "Screen Size")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byResolution)
                }, text: "Resolution")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byRefreshRate)
                }, text: "RefreshRate")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byPowerConsumption)
                }, text: "Power Consumtion")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byHdmiCount)
                }, text: "Number of HDMI")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byUsbCount)
                }, text: "Number of Usb")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byAudioPower)
                }, text: "Audio Power")
                FilterButton(function: {
                    viewModel.reloadAndSortProducts(by: .byBrand)
                }, text: "Brand")

            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
}

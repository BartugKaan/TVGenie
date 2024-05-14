//
//  ProductDetailView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    var item: TVItem
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    WebImage(url: URL(string: item.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 300)
                    Text(item.name)
                        .font(.title)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                            .frame(width: 75,height: 40)
                        Text(item.brand)
                            .foregroundStyle(.white)
                    }
                    HStack{
                        Text("Price : \(item.cost)")
                        Spacer()
                        Text("Ranking : \(item.rank)")
                    }
                    .padding(.top, 8)
                    .font(.title3)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.gray).opacity(0.6)
                    FeatureView(item: item)
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ProductDetailView(item: TVItem(name: "Name", brand: "Brand", warranty: "Warranty", hdmiCount: "2", usbCount: "3", screenSize: "65", audioPower: "20W", refrshRate: "60HZ", screenResolution: "Resolution", powerConsumption: "200W", cost: "19.500 TL", cpuCoreCount: "4", wifiSpecs: "wi-fi 5", screenType: "LED", isSmart: "YES", hdmiType: "HDMİ 2", ciScore: "1", rank: 1, imageUrl: "https://resim.epey.com/902123/m_tcl-58p733-1.png"))
}

struct FeatureView: View {
    var item: TVItem
    var body: some View {
        VStack{
            HStack{
                Text("Features")
                Spacer()
            }
            .padding(.vertical, 4)
            VStack{
                VStack{
                    HStack{
                       Text("Screen")
                        Spacer()
                    }
                    FeatureItem(text: "Refresh Rate : \(item.refrshRate)")
                    FeatureItem(text: "Screen Resulution : \(item.screenResolution)")
                    FeatureItem(text: "Screen Size(inc) : \(item.screenSize) inc")
                    FeatureItem(text: "Screen Type : \(item.screenType)")
                }
                .padding()
                .background(Color(uiColor: .lightGray)).cornerRadius(15)
                VStack{
                    HStack{
                       Text("Connections")
                        Spacer()
                    }
                    FeatureItem(text: "Number of HDMI port : \(item.hdmiCount)")
                    FeatureItem(text: "Number of USB port : \(item.usbCount)")
                }
                .padding()
                .background(Color(uiColor: .lightGray)).cornerRadius(15)
                VStack{
                    HStack{
                       Text("Audio")
                        Spacer()
                    }
                    FeatureItem(text: "Audio Power : \(item.audioPower)")
                }
                .padding()
                .background(Color(uiColor: .lightGray)).cornerRadius(15)
                VStack{
                    HStack{
                       Text("Power")
                        Spacer()
                    }
                    FeatureItem(text: "Power Consumption : \(item.powerConsumption)")
                }
                .padding()
                .background(Color(uiColor: .lightGray)).cornerRadius(15)
                VStack{
                    HStack{
                       Text("Score")
                        Spacer()
                    }
                    FeatureItem(text: "Ci Score : \(item.ciScore)")
                    FeatureItem(text: "Ranking with MCDM : \(item.rank)")
                }
                .padding()
                .background(Color(uiColor: .lightGray)).cornerRadius(15)
                
                
                
            }
            .padding(.horizontal, 16)
            
        }
    }
}

struct FeatureItem: View {
    var text : String
    var body: some View {
        HStack{
                Text(text)
                .font(.title2)
                Spacer()
        }
        .padding(.vertical, 2)
    }
}

//
//  TVCellView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 25.04.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct TVCellView: View {
    @State var name : String
    @State var brand : String
    @State var rank : Int
    @State var imageUrl : String
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80,height: 80)
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    .background(.clear)
                VStack(alignment: .leading){
                    Text(name)
                        .font(.system(size: 20))
                        .padding(.all, 4)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.blue)
                            .frame(width: 60,height: 30)
                        Text(brand)
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("Rank")
                        .fontWeight(.bold)
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(LinearGradient(colors: [.indigo,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                        Text("\(rank)")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding()
        .onAppear{
            
        }
    }
}

#Preview {
    TVCellView(name: "Test", brand: "Beko", rank: 1, imageUrl: "https://resim.epey.com/902123/m_tcl-58p733-1.png")
}

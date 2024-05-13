//
//  TVCellView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 25.04.2024.
//

import SwiftUI

struct TVCellView: View {
    @State var name : String
    @State var brand : String
    @State var rank : Int
    @State var imageUrl : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "tv.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                VStack(alignment: .leading){
                    Text(name)
                        .font(.system(size: 20))
                    Text(brand)
                        .font(.caption)
                    Spacer()
                }
                Spacer()
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
        .padding()
        .onAppear{
            
        }
    }
}

#Preview {
    TVCellView(name: "Test", brand: "Beko", rank: 1, imageUrl: "https://resim.epey.com/902123/m_tcl-58p733-1.png")
}

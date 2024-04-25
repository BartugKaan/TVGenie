//
//  TVCellView.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 25.04.2024.
//

import SwiftUI

struct TVCellView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "tv.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                VStack{
                    Text("TV Name")
                        .font(.title2)
                    Text("TV Brand")
                        .font(.title3)
                    Spacer()
                }
                Spacer()
                ZStack{
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(LinearGradient(colors: [.indigo,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Text("10")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TVCellView()
}

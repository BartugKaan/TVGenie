//
//  BrandButton.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 16.04.2024.
//

import SwiftUI

struct BrandButton: View {
    var backgroundColor : Color
    var text: String
    var body: some View {
        
        Button(action: {
            //TODO: sorgu yapılacak ve yeni ekranda ilgili markanın ürünleri listelenecek
            print(text)
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 35)
                    .frame(width: 75,height: 75)
                    .foregroundStyle(backgroundColor)
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.dark)
            }
        })
        
    }
}

#Preview {
    BrandButton(backgroundColor: Color(uiColor: .secondarySystemBackground), text: "Beko")
}

//
//  FilterButton.swift
//  Capstone Project
//
//  Created by Bartuğ Kaan Çelebi on 14.05.2024.
//

import SwiftUI

struct FilterButton: View {
    var function : () -> Void
    var text : String
    var body: some View {
        Button(action: {
            function()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gray.opacity(0.4))
                    .frame(width: .infinity ,height: 40)
                Text(text)
                    .foregroundStyle(.blue)
                    .padding()
            }
        })
    }
}

#Preview {
    FilterButton(function: {}, text: "Test")
}

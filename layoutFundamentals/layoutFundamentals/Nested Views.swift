//
//  Nested Views.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct Nested_Views: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image("image2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 250)
                    .clipped()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.red)
                    .padding()
                    .background(.yellow)
                    .clipShape(Circle())
                    .offset(x: -10, y: 20)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Rasmalai is Beautiful")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Label("12th Dec 2025", systemImage: "calendar")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
                Text("Rasmalai is very beautiful and tasty. It even has the GI tag. blaa bla bla....dheufhdissja ajsdudh wjd")
                    
            }
            
            
        }
        .padding()
        .background(.yellow.opacity(0.7))
        .clipShape(.rect(cornerRadius: 20))
        .frame(width: 360)
        
    }
}

#Preview {
    Nested_Views()
}

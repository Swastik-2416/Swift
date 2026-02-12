//
//  Nested View 2.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct Nested_View_2: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image("image2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 230)
                    .clipped()
                
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
                    .padding(5)
                    .background(.white)
                    .clipShape(.rect)
                    .offset(x: -10, y: 20)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Rasmalai")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Image(systemName:"star.fill")
                        .font(.subheadline)
                        .offset(x: 250)
                    Image(systemName:"star.fill")
                        .font(.subheadline)
                        .offset(x: 200)
                    Image(systemName:"star.fill")
                        .font(.subheadline)
                        .offset(x: 150)
                }
                Text("Rasmalai is very beautiful and tasty. It even has the GI tag.")
                Text("$1.99")
                    .padding(4)
                    .foregroundStyle(Color.white)
                    .background(.black)
                    .cornerRadius(10)
                    .offset(x: 280, y: 15)
                    
                Button(action: {}) {
                    Text("Add to cart")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .offset(y:-30)
                }
                    
            }
            
            
        }
        .padding()
        .background(.yellow.opacity(0.7))
        .clipShape(.rect(cornerRadius: 20))
        .frame(width: 360)
    }
}

#Preview {
    Nested_View_2()
}

//
//  Nested View 3.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct Nested_View_3: View {
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.teal)
                    .font(.headline)
                    .frame(width: 35, height: 40)
                    .padding()
                    .offset(x: 5, y: -5)
            }
            .padding(10)
            Text("Swastik Mandal")
                .font(.title)
                .bold()
            Text("23scse1180257")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text("Hello, this is a test app for layout fundamentals.").lineSpacing(10)
            
            HStack{
                
                Text("javascript")
                    .font(.subheadline)
                    .padding(3)
                    .background(.teal.opacity(0.2))
                    .cornerRadius(10)
                Text("react")
                    .font(.subheadline)
                    .padding(3)
                    .background(.teal.opacity(0.2))
                    .cornerRadius(10)
                Text("Node Js")
                    .font(.subheadline)
                    .padding(3)
                    .background(.teal.opacity(0.2))
                    .cornerRadius(10)
                
            }
            
        }
        .padding()
        .background(.yellow.opacity(0.1))
        
        .clipShape(Rectangle())
        
        .cornerRadius(20)
        .border(Color.blue, width: 5).cornerRadius(20)
        
        .frame(width:395,height:600)
        
        
        
        
    }
}

#Preview {
    Nested_View_3()
}

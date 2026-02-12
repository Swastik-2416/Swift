//
//  z2.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct z2: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow.opacity(0.5))
                .frame(width: 230, height: 190)
                .cornerRadius(20)
                .zIndex(1)
            Image("image2")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 200, height: 200)
                .zIndex(2)
            Text("Veg")
                .padding(2)
                .font(.default)
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(10)
                .offset(x: 90, y: 80)
                .zIndex(3)
                
            
            
            
        }
    }
}

#Preview {
    z2()
}

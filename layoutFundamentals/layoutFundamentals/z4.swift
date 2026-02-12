//
//  z4.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct z4: View {
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image("Image")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 150, height: 150)
            Image("image2")
                .resizable()
                .scaledToFit()
                .border(Color.black)
                .clipShape(Circle())
                
                .frame(width: 50, height: 50)
                .padding(10)
                
                .offset(x: 5, y: -5)
                
            
            
        }
    }
}

#Preview {
    z4()
}

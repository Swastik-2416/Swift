//
//  z3.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct z3: View {
    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .zIndex(1)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .offset(x: 1, y: 60)
                .zIndex(2)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .offset(x: -15, y: 60)
                .zIndex(2)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .offset(x: 20, y: 60)
                .zIndex(2)
                
        }
    }
}

#Preview {
    z3()
}

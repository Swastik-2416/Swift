//
//  ContentView.swift
//  Image Modifier
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Image")
            
                .resizable()
                .scaledToFit()
                .padding(1)
                .frame(width: 300)
                .clipShape(Circle())
                .overlay(Circle().stroke(.teal, lineWidth: 4))
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

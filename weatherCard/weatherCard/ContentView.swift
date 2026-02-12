//
//  ContentView.swift
//  weatherCard
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.blue.opacity(0.5)
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .shadow(radius: 10)
            
//            .overlay(){
//                Image("Image")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 280, height: 150)
//                VStack {
//                    Text("Hello, World!")
//                }
//            }
       
    }
}

#Preview {
    ContentView()
}

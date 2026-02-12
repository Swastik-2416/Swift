//
//  ContentView.swift
//  Mini App Header
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color.teal
                .frame(width: 300, height: 300)
                .overlay(Text("DONE").foregroundStyle(.white).font(.largeTitle))
                .multilineTextAlignment(.center)
                .overlay(Text("hello").foregroundStyle(.white).font(.largeTitle))
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  MusicCard
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image("Image")
                .cornerRadius(20)
                .shadow(radius: 10)
            Text("Music Name")
                .font(.largeTitle)
            Text("Artist Name")
                .font(.title)
            Text("2025")
                .padding(5)
                .font(.caption)
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

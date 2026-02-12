//
//  ContentView.swift
//  View Modifiers
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to Swift UI!")
                .font(.title)
                .foregroundStyle(.purple)
            Image(systemName: "star.fill")
                .font(.system(size: 50))
                .foregroundStyle(Color.yellow)
            Color.blue
                .frame(height: 40)
                .clipShape(.capsule)
            Circle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .shadow(color: .teal, radius: 10)
                .padding(10)
            Button("Tap me!") {}
//                .background(.blue.opacity(0.2))
                .padding()
                .background(.blue.opacity(0.2))
                .cornerRadius(10)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

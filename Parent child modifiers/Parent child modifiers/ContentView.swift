//
//  ContentView.swift
//  Parent child modifiers
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Title")
                .font(.title)
                .foregroundStyle(.blue)
                .background(.red)
            Text("Subtitle")
                .foregroundStyle(Color.green)
        }
        .padding()
        .background(.yellow)
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}

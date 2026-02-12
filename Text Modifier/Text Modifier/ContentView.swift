//
//  ContentView.swift
//  Text Modifier
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, how are you doing today?")
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .foregroundStyle(.teal)
                .italic()
                .font(.largeTitle)
                .fontWeight(.ultraLight)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

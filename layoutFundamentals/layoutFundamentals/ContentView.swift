//
//  ContentView.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 2) {
            Image("Image")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
            Text("Swastik")
                .font(.largeTitle)
                .bold()
            Text("23scse1180257")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text("Hello, this is a test app for layout fundamentals.").lineSpacing(10)
        }
        .padding()
        .background(.yellow.opacity(0.1))
        .frame(width:300)
    }
}

#Preview {
    ContentView()
}

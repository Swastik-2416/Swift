//
//  ContentView.swift
//  parameterizedModifier
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.black
            .frame(width: 300, height: 300)
            .watermarked(with: "Apple.Inc")
    }
}
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottomTrailing) {
                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
            }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}

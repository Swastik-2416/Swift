//
//  ContentView.swift
//  customModifier
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
            .background(Color.yellow)
        
    }
}
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Realme").titleStyle()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

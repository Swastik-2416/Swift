//
//  ContentView.swift
//  borderModifier
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct Border: ViewModifier {
    var borderColor: Color
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: borderWidth))
        
    }
    
}
extension View {
    func border(
        color: Color = .gray,
        width: CGFloat = 2,
        cornerRadius: CGFloat = 4
    ) -> some View {
        modifier(Border(borderColor: color, borderWidth: width, cornerRadius: cornerRadius))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Default border")
                .border()
            Text("Red border")
                .border(color: .red, cornerRadius: 10)
            Text("Green border")
                .border(color: .green, width: 3)
                
        }
        .padding()
    }
}


#Preview {
    ContentView()
}

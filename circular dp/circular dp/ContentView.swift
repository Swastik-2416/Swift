//
//  ContentView.swift
//  circular dp
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct ProfilePicture: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
        
}
extension View {
    func profilePicture() -> some View {
        modifier(ProfilePicture())
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .profilePicture()
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .profilePicture()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

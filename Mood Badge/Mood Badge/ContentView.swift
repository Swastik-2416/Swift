//
//  ContentView.swift
//  Mood Badge
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Urgent Need")
                .font(.largeTitle)
                .foregroundStyle(Color(.systemBlue))
            Image(systemName: "cup.and.heat.waves")
                .font(.system(size: 100))
                .foregroundStyle(.tint)
            
        }
        .padding()
        .border(Color(.systemBlue))
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}

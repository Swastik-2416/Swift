//
//  ContentView.swift
//  Label Modifier
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Label("Upload", systemImage: "square.and.arrow.up")
                .labelStyle(.titleAndIcon)
            Label("Settings", systemImage: "gearshape")
                .labelStyle(.iconOnly)
        }
        VStack {
            Label {
                Text("Gallery")
                    .font(.headline)
                    .foregroundColor(.blue)
            } icon: {
                Image(systemName: "photo")
                    .font(.title2)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  PageTab
//
//  Created by GU on 02/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageStyleView()
    }
}
struct PageStyleView: View {
    var body: some View {
        TabView {
            Tab() {
                Text("PAge1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
            }
            Tab() {
                Text("PAge2")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow)
            }
            Tab() {
                Text("PAge3")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
            }
            Tab("red", systemImage: "circle.fill") {
                Text("PAge4")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
            }
            Tab() {
                Text("PAge5")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow)
            }
            Tab() {
                Text("PAge6")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
            }
        }
//        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("HEllo, World!djdfj asjdhsifh ajdjakdbne jajdhkak(.fixedSize())")
                .padding()
                .background(.yellow)
                .fixedSize()
                
            
        }
        .padding()
        .frame(width: 150, height: 150)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}

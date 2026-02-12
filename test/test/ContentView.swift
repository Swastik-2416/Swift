//
//  ContentView.swift
//  test
//
//  Created by Swastik Mandal on 11/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            Text("Hello, world!")
                .frame(width:50, height:50)
                .padding()
                .glassEffect()
        }
       
        
    }
}

#Preview {
    ContentView()
}

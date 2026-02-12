//
//  ContentView.swift
//  Counter
//
//  Created by GU on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var state: Bool = true
    var body: some View {
        VStack {
            if state {
                Color.white
            } else {
                Color.black
            }
            Button("Switch \(state ? "On" : "Off")") {
                state.toggle()
            }
        }
        
    }
}


#Preview {
    ContentView()
}

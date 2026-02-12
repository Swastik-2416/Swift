//
//  ContentView.swift
//  statebindings
//
//  Created by GU on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var status = 0
    var body: some View {
        VStack {
            Text("Swift UI Song")
            let state: [String] = ["Stopped", "Playing", "Buffering"]
            Text("State: \(state[status%3])")
            Button(action: {
                status += 1
            }, label : {
                Text("Play Next")
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}



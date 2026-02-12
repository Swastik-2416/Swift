//
//  ContentView.swift
//  myBadge
//
//  Created by GU on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Color.blue
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay() {
                    VStack {
                        Text("30")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("min")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

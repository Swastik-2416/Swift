//
//  ContentView.swift
//  Traffic Light
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Start the Red light", destination: Red_Light_View())
                
        }
    }
}

#Preview {
    ContentView()
}

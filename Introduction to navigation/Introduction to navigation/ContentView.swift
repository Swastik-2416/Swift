//
//  ContentView.swift
//  Introduction to navigation
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Go to second screen"){
                Secomd_Screen()
            }
            .font(.largeTitle)
            .navigationTitle(Text("Content View"))
        }
            
    }
}

#Preview {
    ContentView()
}

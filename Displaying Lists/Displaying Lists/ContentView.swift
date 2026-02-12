//
//  ContentView.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            HStack {
                Text("Prem Kumar")
                Image(systemName: "star.fill")
            }
            
            Text("Gaurav")
            Text("Aditya Gupta")
            Text("Saksham iOS")
        }
    }
}

#Preview {
    ContentView()
}

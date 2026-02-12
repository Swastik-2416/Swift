//
//  ContentView.swift
//  ProfileApp
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Text("Profile")
            List {
                NavigationLink(destination:Second_Screen()) {
                    HStack{
                        Image(systemName: "graduationcap.fill")
                            .foregroundStyle(Color.blue)
                        Text("Education")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

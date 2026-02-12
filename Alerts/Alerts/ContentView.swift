//
//  ContentView.swift
//  Alerts
//
//  Created by Swastik Mandal on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        Button("Delete Item") {
            showAlert = true
        }
        .alert("Are you sure you want to delete?", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {
                print("Deleted")
            }
            Button("Cancel", role: .cancel){}
        }
    }
}

#Preview {
    ContentView()
}

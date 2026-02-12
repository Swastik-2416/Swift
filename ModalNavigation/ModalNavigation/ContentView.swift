//
//  ContentView.swift
//  ModalNavigation
//
//  Created by Swastik Mandal on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        VStack(spacing:20) {
            Text("Home Screen")
                .font (.largeTitle)
            Button("Show Details") {
                showSheet.toggle()
            }
            .font(.title)
        }
        .sheet(isPresented: $showSheet) {
            DetailView()
        }
    }
}

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                Text("This is a sheet")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.topBarLeading){
                    Button("Done") {
                        dismiss()
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  IndianPlacesExplorer
//
//  Created by kiran singh on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPlace : Place?
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
                    List(places) { place in
                        Button {
                            selectedPlace = place
                        } label : {
                            HStack(spacing: 16) {
                                Image(place.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                Text(place.name)
                                    .font(.headline)
                            }
                            .padding(.vertical, 4)
                            
                            
                        }
                    }
                    .sheet(item: $selectedPlace) { place in
                        Image(place.imageName)
                            .resizable()
                            .scaledToFit()
                        Text(place.name)
                            .font(.largeTitle)
                            .presentationDetents([.medium, .large])
                    }
                    .onLongPressGesture {
                        showAlert = true
                    }
                    .alert("Product Selected", isPresented: $showAlert, presenting: selectedPlace) {
                        product in
                        Button("OK", role: .cancel){}
                    } message: { place in
                        Text("\(place.name) and \(place.description) ")
                    }
                    
                        
                    .navigationTitle("Explore India")
                }
            }
        }


#Preview {
    ContentView()
}

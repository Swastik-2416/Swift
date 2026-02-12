//
//  StateSelectionView.swift
//  EnableLocationScreen
//
//  Created by Swastik Mandal on 12/02/26.
//

import SwiftUI

struct MapState: Identifiable {
    let id = UUID()
    let name: String
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
}

struct StateSelectionView: View {
    
    @Binding var currentPage: Int // Added binding
    @State private var selectedStates: Set<String> = []
    
    // Initial positions set to approximate coordinates.
    // DRAG the states in the preview/simulator to position them correctly.
    // The console will print the new coordinates to copy-paste back here.
    @State private var states: [MapState] = [
        MapState(name: "Andhra Pradesh", x: 170, y: 380, width: 140),
        MapState(name: "Arunachal Pradesh", x: 370, y: 140, width: 80),
        MapState(name: "Assam", x: 340, y: 160, width: 90),
        MapState(name: "Bihar", x: 260, y: 190, width: 90),
        MapState(name: "Chattisgarh", x: 220, y: 260, width: 100),
        MapState(name: "Gujrat", x: 80, y: 240, width: 130),
        MapState(name: "Haryana", x: 130, y: 120, width: 70),
        MapState(name: "Himachal Pradesh", x: 140, y: 70, width: 60),
        MapState(name: "Jammu & Kashmir", x: 120, y: 40, width: 120),
        MapState(name: "Jharkhand", x: 270, y: 220, width: 80),
        MapState(name: "Karnataka", x: 130, y: 410, width: 100),
        MapState(name: "Kerela", x: 150, y: 490, width: 50),
        MapState(name: "Madhya Pradesh", x: 180, y: 240, width: 140),
        MapState(name: "Maharashtra", x: 130, y: 320, width: 140),
        MapState(name: "Manipur", x: 360, y: 180, width: 35),
        MapState(name: "Meghalaya", x: 325, y: 170, width: 50),
        MapState(name: "Mizoram", x: 350, y: 200, width: 30),
        MapState(name: "Nagaland", x: 370, y: 160, width: 35),
        MapState(name: "Orissa", x: 270, y: 280, width: 90),
        MapState(name: "Punjab", x: 120, y: 100, width: 80),
        MapState(name: "Rajasthan", x: 90, y: 160, width: 150),
        MapState(name: "Sikkim", x: 300, y: 130, width: 35),
        MapState(name: "Tamil Nadu", x: 190, y: 480, width: 100),
        MapState(name: "Telangana", x: 180, y: 360, width: 100),
        MapState(name: "Tripura", x: 330, y: 190, width: 35),
        MapState(name: "Uttar Pradesh", x: 210, y: 160, width: 130),
        MapState(name: "Uttarakhand", x: 180, y: 100, width: 60),
        MapState(name: "West Bengal", x: 310, y: 230, width: 70)
    ]

    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                // Header
                VStack(spacing: 8) {
                    Text("Where do you belong?")
                        .font(.title)
                        .fontWeight(.bold) // Fallback
                        .foregroundColor(.white)
                    
                    Text("Select your home state or region")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(.top, 60)
                
                Spacer()
                
                // Map Container
                ZStack {
                    ForEach($states) { $state in
                        stateButton(for: state.name)
                            .frame(width: state.width > 0 ? state.width : nil)
                            .position(x: state.x, y: state.y)
                            // Drag Gesture to help user position the puzzle pieces
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        state.x = value.location.x
                                        state.y = value.location.y
                                    }
                                    .onEnded { _ in
                                        print("Updated State: \(state.name), x: \(Int(state.x)), y: \(Int(state.y)), width: \(Int(state.width))")
                                        // Optional: Print all for easy copy-paste
                                        printAllCoordinates()
                                    }
                            )
                    }
                }
                .frame(width: 400, height: 550) // Fixed frame for the map area
                // .border(Color.white.opacity(0.3)) // Uncomment to see map boundary
                
                Spacer()
                
                Button(action: {
                    print(selectedStates)
                    withAnimation {
                        // Assuming this is the last step for now, but keeping the pattern
                        // If there are more steps, this will navigate.
                        currentPage += 1
                    }
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryColor)
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
                
            }
        }
    }
    
    func printAllCoordinates() {
        print("----- CURRENT COORDINATES -----")
        for state in states {
            print("MapState(name: \"\(state.name)\", x: \(Int(state.x)), y: \(Int(state.y)), width: \(Int(state.width))),")
        }
        print("-------------------------------")
    }
    
    func stateButton(for state: String) -> some View {
        Button {
            toggleSelection(state)
        } label: {
            Image(state)
                .renderingMode(.template) // Ensure it treats the alpha channel as shape
                .resizable()
                .scaledToFit()
                .foregroundStyle(
                    selectedStates.contains(state)
                    ? Color.gray   // selected color
                    : Color.primaryColor   // default map color
                )
                // Add shadow/stroke if needed to differentiate pieces
                // .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
        }
        .buttonStyle(.plain) // Important to avoid button background
    }
    
    func toggleSelection(_ state: String) {
        if selectedStates.contains(state) {
            selectedStates.remove(state)
        } else {
            selectedStates.insert(state)
        }
    }
}

#Preview {
    StateSelectionView(currentPage: .constant(3))
}

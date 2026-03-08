//
//  PreferenceView.swift
//  EnableLocationScreen
//
//  Created by Swastik Mandal on 12/02/26.
//

import SwiftUI

struct PreferenceView: View {
    
    @State private var selectedItems: Set<String> = []
    
    let items: [(title: String, image: String)] = [
        ("Food", "food"),
        ("Festivals", "festivals"),
        ("Language", "language"),
        ("People", "people"),
        ("Music", "music"),
        ("Traditions", "traditions")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible(), spacing: 18)
    ]
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 6) {
                Text("What do you miss?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Select all that apply (choose at least one)")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            
            // MARK: - Grid
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.title) { item in
                    cardView(item: item)
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            // MARK: - Continue Button
            Button {
                
            } label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedItems.isEmpty ? .white.opacity(0.5) : .appPrimary)
                    .foregroundColor(selectedItems.isEmpty ? .appPrimary : .white)
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.2), radius: 10, y: 6)
            }
            .disabled(selectedItems.isEmpty)
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [.topGradient, .bottomGradient],
                startPoint: .top,
                endPoint: .bottom
            )
        )

        .ignoresSafeArea()
    }
    
    // MARK: - Card View
    func cardView(item: (title: String, image: String)) -> some View {
        
        let isSelected = selectedItems.contains(item.title)
        
        return Button {
            toggle(item.title)
        } label: {
            VStack(spacing: 0) {
                
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle(Color.appPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.white.opacity(0.85))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.appPrimary : Color.white.opacity(0.3),
                            lineWidth: isSelected ? 3 : 1)
            )
            .scaleEffect(isSelected ? 0.96 : 1)
            .animation(.spring(response: 0.3), value: isSelected)
            .shadow(color: .black.opacity(0.15), radius: 10, y: 6)
        }
    }
    
    // MARK: - Toggle Logic
    func toggle(_ title: String) {
        if selectedItems.contains(title) {
            selectedItems.remove(title)
        } else {
            selectedItems.insert(title)
        }
    }
}

#Preview {
    PreferenceView()
}



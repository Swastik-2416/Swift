//
//  ContentView.swift
//  DashboardTask
//
//  Created by Swastik Mandal on 04/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Grid{
            Rectangle()
                .frame(height:200)
                .foregroundStyle(.cyan)
                .cornerRadius(20)
            GridRow{
                Color.orange
                Color.green
                    
                }
            .cornerRadius(20)
            Rectangle()
                .frame(height:350)
                .foregroundStyle(.yellow)
                .cornerRadius(20)
            }
        .padding()
        
        }
        
    }


#Preview {
    ContentView()
}

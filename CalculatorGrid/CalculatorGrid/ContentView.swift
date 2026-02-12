//
//  ContentView.swift
//  CalculatorGrid
//
//  Created by Swastik Mandal on 04/02/26.
//

import SwiftUI

struct Operation: View {
//    let text: String
    var body: some View {
        
        
    }
}
struct Numbers: View {
    
    var body: some View {
        
    }
}

struct ContentView: View {
    var body: some View {
        Grid{
            GridRow() {
                Operation()
                Operation()
                Operation()
                Operation()
            }
            GridRow() {
                Numbers()
                Numbers()
                Numbers()
                Operation()
            }
            GridRow() {
                Numbers()
                Numbers()
                Numbers()
                Operation()
            }
            GridRow() {
                Numbers()
                Numbers()
                Numbers()
                Operation()
            }
            GridRow() {
                Numbers()
                Numbers()
                Numbers()
                Operation()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

//
//  DetentView.swift
//  ModalNavigation
//
//  Created by Swastik Mandal on 30/01/26.
//

import SwiftUI

struct CustomDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return context.maxDetentValue-150
    }
}

struct DetentView: View {
    @State private var showMediumSheet = false
    @State private var showLargeSheet = false
    @State private var showVariableSheet = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Show medium sheet") {
                showMediumSheet = true
            }
            .sheet(isPresented: $showMediumSheet) {
                Text("Medium Sheet")
                    .presentationDetents([.medium])
            }
            
            Button("Show large sheet") {
                showLargeSheet = true
            }
            .sheet(isPresented: $showLargeSheet) {
                Text("Large Sheet")
                    .presentationDetents([.large])
            }
            
            Button("Show variable sheet") {
                showVariableSheet = true
            }
            .sheet(isPresented: $showVariableSheet) {
                Text("Variable Sheet")
//                    .presentationDetents([.height(350), .fraction(0.7)])
                    .presentationDetents([.custom(CustomDetent.self)])
            }
            .presentationDragIndicator(.visible)
        
        }
    }
}

#Preview {
    DetentView()
}

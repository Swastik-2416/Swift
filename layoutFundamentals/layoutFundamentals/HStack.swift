//
//  HStack.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct MyHStackView: View {
    var body: some View {
        SwiftUI.HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.largeTitle)
            Text("4.0")
            
        }
    }
}

#Preview {
    MyHStackView()
}

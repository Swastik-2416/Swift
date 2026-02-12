//
//  minWidth.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct minWidth: View {
    var body: some View {
        HStack {
            Color.orange
                .frame(minWidth: 100, idealWidth: 120, maxWidth: 150)
                .border(Color.red)
            
        }
        .frame(width: 250)
        .border(.black)
        
    }
    
}

#Preview {
    minWidth()
}

//
//  h2.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct h2: View {
    var body: some View {
        HStack{
            Text("Developer")
                .bold()
            Text("javascript")
                .font(.subheadline)
            Text("react")
                .font(.subheadline)
            Text("Node Js")
                .font(.subheadline)
            
        }
    }
}

#Preview {
    h2()
}

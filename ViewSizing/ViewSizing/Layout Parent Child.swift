//
//  Layout Parent Child.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct Layout_Parent_Child: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, World!")
                    .padding()
                    .background(.green.opacity(0.3))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .border(.red)
        }
    }
}

#Preview {
    Layout_Parent_Child()
}

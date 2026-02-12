//
//  Stylish Text.swift
//  statebindings
//
//  Created by GU on 07/01/26.
//

import SwiftUI

struct Stylish_Text: View {
    @State private var selected: Bool = false
    var body: some View {
        VStack {
            Button(action: {
                selected.toggle()
            }, label: {
                Text("Toggle")
            })
            StylishText(selected: $selected)
            Text("Hello World")
                .background(selected ? Color.blue: Color.red)
        }
    }
}

#Preview {
    Stylish_Text()
}
struct StylishText: View {
    @Binding var selected: Bool
    var body: some View {
        Text("Hello World")
            .background(selected ? Color.red: Color.blue)
    }
}

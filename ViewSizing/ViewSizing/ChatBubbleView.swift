//
//  ChatBubbleView.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct ChatBubbleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, World!,dfhdfhshshfdjfkjfhsbe")
                    .frame(maxWidth: 200, idealHeight: 150)
                    .padding(10)
                    .background(.green.opacity(0.3))
                    .cornerRadius(10)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Helo, World!,qiqowiesjsjakjsjoWIU9QWUUD9X9238QK")
                    .frame(maxWidth: 200, idealHeight: 150)
                    .padding(10)
                    .background(.blue.opacity(0.3))
                    .cornerRadius(10)
                
            }
        }
        .frame(maxWidth: 380)
    }
}

#Preview {
    ChatBubbleView()
}

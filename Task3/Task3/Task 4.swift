//
//  Task 4.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct Task_4: View {
    @State var friend = ["A", "B", "C", "D", "E"]
    var body: some View {
        
        VStack {
            ForEach(friend, id: \.self) { name in
                Text(name)
            }
            Button("Add a friend"){
                friend.append("F")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    Task_4()
}

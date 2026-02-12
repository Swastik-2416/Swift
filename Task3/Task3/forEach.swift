//
//  forEach.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct forEach: View {
    var fruits = ["Apple", "Banana", "Cherry", "Grapes", "Orange"]
    var body: some View {
        ForEach(fruits, id: \.self) { fruit in
            Text(fruit)
                .font(.largeTitle)
        }
    }
}

#Preview {
    forEach()
}

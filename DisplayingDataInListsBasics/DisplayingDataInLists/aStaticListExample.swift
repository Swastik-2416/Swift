//
//  aStaticListExample.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: List is container view that presents rows of data arranged in a single column, optionally providing the ability to select one or more members.

// MARK: Automatically supports scrolling, can be static or dynamic, works seamlessly with NavigationStack

import SwiftUI

struct aStaticListExample: View {
    var body: some View {
        Text("Shopping List")
            .font(.title)
            .bold()
        
        List {
            Text("Milk")
            Text("Bread")
            Text("Eggs")
            Text("Fruits")
            Text("Vegetables")
        }
    }
}

#Preview {
    aStaticListExample()
}

//
//  Task1.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct Task1: View {
    @State private var friends = ["Alice", "Bob", "Charlie", "Eve", "Frank"]
    
    @State private var newFriend = ""
    
    var body: some View {
        List(friends, id: \.self) { friend in
            Text(friend)
        }
        TextField("New Friend", text: $newFriend)
            .onSubmit {
                friends.append(newFriend)
                
        }
        
    }
}

#Preview {
    Task1()
}

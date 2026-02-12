//
//  eDynamicListTask.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct eDynamicListTask: View {
    @State private var myFriends = ["John Doe",
                                    "Jane Doe",
                                    "Alex Smith",
                                    "Chris Brown",
                                    "Sam Taylor"]
    
    @State var newFriend = ""
    
    var body: some View {
        Text("My Friends")
            .font(.title)
            .bold()
        
        List(myFriends, id: \.self) { friend in
            Text(friend)
        }
        
        TextField("Add new friend to the list", text: $newFriend)
            .padding()
            .onSubmit {
                myFriends.append(newFriend)
            }
    }
}

#Preview {
    eDynamicListTask()
}

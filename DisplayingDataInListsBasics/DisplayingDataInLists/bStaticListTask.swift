//
//  bStaticListTask.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct bStaticListTask: View {
    var body: some View {
        Text("My Friends")
            .font(.title)
            .bold()
        
        List {
            Text("John Doe")
            Text("Jane Doe")
            Text("Alex Smith")
            Text("Chris Brown")
            Text("Sam Taylor")
        }
    }
}

#Preview {
    bStaticListTask()
}

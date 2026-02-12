//
//  fListUsingForEach.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: ForEach provides flexibility to include multiple collection-based items inside a List, and it also allows combining static and dynamic content within the same list view.

import SwiftUI

struct fListUsingForEach: View {
    var mysteryBooks: [Book] = [ Book(name: "Normal People"),
                                 Book(name: "The Girl with the Dragon Tattoo"),
                                 Book(name: "The Golden Notebook"),
                                 Book(name: "Life of Pi"),
                                 Book(name: "The Alchemist"),
                                 Book(name: "The Hobbit")]
    
    var sciFiBooks: [Book] = [ Book(name: "The Martian"),
                               Book(name: "1984"),
                               Book(name: "2001: A Space Odyssey"),
                               Book(name: "I, Robot")]
    
    var body: some View {
        List {
            Text("Mystery Books")
                .font(.title)
                .bold()
            
            ForEach(mysteryBooks) {
                Text($0.name)
            }
            
            Text("SciFi Books")
                .font(.title)
                .bold()
            
            ForEach(sciFiBooks) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    fListUsingForEach()
}

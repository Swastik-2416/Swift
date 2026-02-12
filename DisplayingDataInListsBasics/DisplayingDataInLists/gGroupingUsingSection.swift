//
//  gGroupingUsingSection.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: SwiftUI provides Section to structure and organize content within a List.

import SwiftUI

struct gGroupingUsingSection: View {
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
            Section {
                ForEach(mysteryBooks) {
                    Text($0.name)
                }
            }
            
            Section {
                ForEach(sciFiBooks) {
                    Text($0.name)
                }
            }
        }
    }
}

#Preview {
    gGroupingUsingSection()
}

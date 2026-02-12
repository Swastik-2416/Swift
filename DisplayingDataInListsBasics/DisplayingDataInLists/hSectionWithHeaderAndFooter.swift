//
//  hSectionWithHeaderAndFooter.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: Section headers label grouped content, while footers provide additional context or information.

import SwiftUI

struct hSectionWithHeaderAndFooter: View {
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
            } header: {
                Text("Mystery Books")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
            } footer: {
                Text("A curated collection of popular mystery novels.")
            }
            
            Section {
                ForEach(sciFiBooks) {
                    Text($0.name)
                }
            } header: {
                Text("SciFi Books")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
            } footer: {
                Text("Science fiction books exploring futuristic ideas.")
            }
        }
    }
}

#Preview {
    hSectionWithHeaderAndFooter()
}

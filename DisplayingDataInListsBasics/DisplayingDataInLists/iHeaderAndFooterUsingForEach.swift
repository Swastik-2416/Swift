//
//  iHeaderAndFooterUsingForEach.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct Book2: Identifiable {
    let id = UUID()
    let name: String
}

struct BookCollection: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let books: [Book2]
}

struct iHeaderAndFooterUsingForEach: View {
    @State private var bookCollections: [BookCollection] = [
        BookCollection(name: "Mystery Books",
                       description: "A curated collection of popular mystery novels.",
                       books: [Book2(name: "Normal People"),
                               Book2(name: "The Girl with the Dragon Tattoo"),
                               Book2(name: "The Golden Notebook"),
                               Book2(name: "Life of Pi"),
                               Book2(name: "The Alchemist"),
                               Book2(name: "The Hobbit")]),
        BookCollection(name: "SciFi Books",
                       description: "Science fiction books exploring futuristic ideas.",
                       books: [Book2(name: "The Martian"),
                               Book2(name: "1984"),
                               Book2(name: "2001: A Space Odyssey"),
                               Book2(name: "I, Robot")])]
    
    var body: some View {
        List {
            ForEach(bookCollections) { collection in
                Section {
                    ForEach(collection.books) { book in
                        Text(book.name)
                    }
                } header: {
                    Text(collection.name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.black)
                } footer: {
                    Text(collection.description)
                }
            }
        }
    }
}

#Preview {
    iHeaderAndFooterUsingForEach()
}

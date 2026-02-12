//
//  dDynamicListCustomType.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var name: String
}

struct dDynamicListCustomType: View {
    @State private var books: [Book] = [Book(name: "Normal People"),
                                        Book(name: "The Girl with the Dragon Tattoo"),
                                        Book(name: "The Golden Notebook"),
                                        Book(name: "Life of Pi"),
                                        Book(name: "The Alchemist"),
                                        Book(name: "The Hobbit")]
    
    @State private var newBook = ""
    
    var body: some View {
        Text("Books")
            .font(.title)
            .bold()
        
        List(books) { book in
            Text(book.name)
        }
        
        //Can use shorthand notation also
//        List(books) {
//            Text($0.name)
//        }
        
        TextField("Add new book to the list", text: $newBook)
            .padding()
            .onSubmit {
                books.append(Book(name: newBook))
            }
    }
    
}

#Preview {
    dDynamicListCustomType()
}

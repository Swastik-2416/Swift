//
//  cDynamicListBuiltInType.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct cDynamicListBuiltInType: View {
    @State private var books = ["Normal People",
                                "The Girl with the Dragon Tattoo",
                                "The Golden Notebook",
                                "Life of Pi",
                                "The Alchemist","The Hobbit"]
    
    @State private var newBook = ""
    
    var body: some View {
        Text("Books")
            .font(.title)
            .bold()
        
        List(books, id: \.self) { book in
            Text(book)
        }
        
        TextField("Add new book to the list", text: $newBook)
            .padding()
            .onSubmit {
                books.append(newBook)
            }
    }
    
}

#Preview {
    cDynamicListBuiltInType()
}

//
//  Custom type.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    var name: String
}
struct BookCollection: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var books: [Book]
}
struct Custom_type: View {
//    @State private var books = [Book(name: "Swift"), Book(name: "iOS")]
    var bookCollection = [ BookCollection(name: "Mysteries", description: "A collection of mystery books", books: [Book(name: "Swift"), Book(name: "iOS"), Book(name: "Python")]),
    BookCollection(name: "Science Fiction", description: "A collection of science fiction books", books: [Book(name: "Swift"), Book(name: "iOS")])]
        
//    @State private var mysteryBooks = [Book(name: "Swift"), Book(name: "iOS"), Book(name: "Python")]
//    @State private var scifiBooks = [Book(name: "Swift"), Book(name: "iOS")]
    
    @State private var newBook = ""
    var body: some View {
        //        List(books) {
        //            Text($0.name)
        //        }
        //        TextField("New Book", text: $newBook)
        //            .onSubmit {
        //                books.append(Book(name: newBook))
        //            }
        //        List {
        //            Text("Mystery Books")
        //                .font(.headline)
        //            ForEach(mysteryBooks) { book in
        //                Text(book.name)
        //            }
        //            Text("Science Fiction Books")
        //                .font(.headline)
        //            ForEach(scifiBooks) { book in
        //                Text(book.name)
        //            }
        //        }
        List {
            ForEach(bookCollection) {collection in
                Section {
                    ForEach (collection.books) { book in
                        Text(book.name)
                    }
                        
                } header: {
                    Text(collection.name)
                } footer: {
                    Text(collection.description)
                }
            }
        }
            
    }
    
}

#Preview {
    Custom_type()
}

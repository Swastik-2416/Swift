//
//  ContentView.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI
//ownership is the problem with State, bindable,observable,

struct ContentView: View {
    //@State private var book=Book(title: "Sample Title", author: "Sample Author")
    @Environment(Book.self) private var book
    var body: some View {
        NavigationStack {
            VStack{
                Text("Title: \(book.title)")
                Text("Author: \(book.author)")
                NavigationLink{
                    BookEditView(book: book)
                } label:{
                    Text("Edit Book")
                }
            }
            .navigationTitle("Books")
        }
    }
}

#Preview {
    ContentView()
        .environment(Book(title: "Sample Title", author: "Sample Author"))
}

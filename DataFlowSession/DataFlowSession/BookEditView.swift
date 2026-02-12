//
//  BookEditView.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct BookEditView: View {
    @Bindable var book: Book
    var body: some View {
        Form{
            TextField("title",text: $book.title)
            TextField("author",text: $book.author)
        }
        .navigationTitle("Edit Book")
    }
}

#Preview {
    BookEditView(book: Book(title: "Sample Title", author: "Sample Author"))
}

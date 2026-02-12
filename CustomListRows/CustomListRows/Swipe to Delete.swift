//
//  Swipe to Delete.swift
//  CustomListRows
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct Swipe_to_Delete: View {
    
    @State private var books: [Book] =  DataModel.books
    
    var body: some View {
        List {
            ForEach(books) { book in
                BookRowView(book: book)
            }
            .onDelete(perform: delete)
        }
        
    }
    func delete(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
    }
}

#Preview {
    Swipe_to_Delete()
}

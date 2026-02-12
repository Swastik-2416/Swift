//
//  Swipe Actions.swift
//  CustomListRows
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct Swipe_Actions: View {
    @State private var books: [Book] =  DataModel.books

    var body: some View {
        List {
            ForEach(books) { book in
                BookRowView(book: book)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button(role: .destructive) {
                    
                } label : {
                    Image(systemName: "trash")
                }
                .tint(.red)
            }
            .swipeActions(edge: .trailing) {
                Button {
                     
                }label : {
                    Image(systemName: "pencil")
                }
                .tint(.accentColor)
                Button {
                     
                }label : {
                    Image(systemName: "Trash")
                }
                .tint(.accentColor)
            }
        }
    }
}

#Preview {
    Swipe_Actions()
}

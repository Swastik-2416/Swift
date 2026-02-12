//
//  On Move Modifier.swift
//  CustomListRows
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct On_Move_Modifier: View {
    @State private var books: [Book] =  DataModel.books
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookRowView(book: book)
                }
                .onMove(perform: moveItem)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    func moveItem(indices: IndexSet, to destination: Int) {
        books.move(fromOffsets: indices, toOffset: destination)
    }
}

#Preview {
    On_Move_Modifier()
}

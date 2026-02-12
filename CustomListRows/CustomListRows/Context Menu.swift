//
//  Context Menu.swift
//  CustomListRows
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct Context_Menu: View {
    @State private var books: [Book] =  DataModel.books

    var body: some View {
        List {
            ForEach(books) { book in
                BookRowView(book: book)
            }
            .contextMenu {
                Button {
                } label: {
                    Label("Remove", systemImage: "trash")
                }
                Button{
                    
                } label : {
                    Label("Edit", systemImage: "pencil")
                }
            }
        }
    }
}

#Preview {
    Context_Menu()
}

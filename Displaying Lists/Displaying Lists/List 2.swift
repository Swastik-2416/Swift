//
//  List 2.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct List_2: View {
    @State private var books = ["ABC", "XYZ", "JKL", "NOP", "MNO"]
    
    @State private var newBook = ""
    
    
    var body: some View {
        List (books, id: \.self) {
            book in Text(book)
        }
        
        TextField("New Book", text: $newBook)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .onSubmit {
                books.append(newBook)
                
        }
    }
}

#Preview {
    List_2()
}

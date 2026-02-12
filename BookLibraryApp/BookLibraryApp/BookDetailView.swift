//
//  BookDetailView.swift
//  BookLibraryApp
//
//  Created by Dr. Vinod Kumar on 29/01/26.
//

import SwiftUI

struct BookDetailView: View {
    let book : Book
    // TODO 8: Add @Binding var path
    let libraryModel : LibraryModel
    var body: some View {
        VStack(spacing: 20){
            // TODO 9: Display book information
            // Show: book icon, title, author name, pages
            
            // TODO 10: Add button "View Author Details"
            // This button should append the author to path
            // Use libraryModel.getAuthor(byName:) to get author
           
            // TODO 11: Display path count
            
            Spacer()
        }
        .padding()
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BookDetailView()
}

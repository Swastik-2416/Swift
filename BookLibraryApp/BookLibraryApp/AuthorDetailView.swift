//
//  AuthorDetailView.swift
//  BookLibraryApp
//
//  Created by Dr. Vinod Kumar on 29/01/26.
//

import SwiftUI

struct AuthorDetailView: View {
    let author: Author
    // TODO 12: Add @Binding var path
    let libraryModel: LibraryModel
    var body: some View {
        List{
            // TODO 13: Create "Author Info" section
            // Display: person icon, author name, country
            Section("Author Info"){
                //Your code here
            }
            // TODO 14: Create "Books by [author name]" section
            // Use libraryModel.getBooks(byAuthor:) to get books
            // Each book should be a Button that appends book to path
            Section("Books by \(author.name)"){
                // Your code here
                
            }
            // TODO 15: Create "Navigation Controls" section
            // Add two buttons:
            // 1. "Go Back One Screen" - use path.removeLast()
            // 2. "Back to Home" - use path.removeLast(path.count)
            Section("Navigation Controls"){
                // Your code here
            }
            // TODO 16: Display path count
            Section("Navigation Info"){
                //Your code here
            }
        }
        .navigationTitle("Author Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AuthorDetailView()
}

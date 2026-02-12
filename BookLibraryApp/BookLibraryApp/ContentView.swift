//
//  ContentView.swift
//  BookLibraryApp
//
//  Created by Dr. Vinod Kumar on 28/01/26.
//

import SwiftUI

struct ContentView: View {
    // TODO 1: Create NavigationPath state variable
    let libraryModel = LibraryModel()
    var body: some View {
        // TODO 2: Create NavigationStack and bind path

            List{
                // TODO 3: Create "Books" section
                // Show all books from libraryModel.books
                // Each book should be a Button that appends book to path
                // Display: book icon, title, and pages
                Section("Books") {
                        // Your code here
                }
                    // TODO 4: Create "Authors" section
                    // Show all authors from libraryModel.authors
                    // Each author should be a Button that appends author to path
                    // Display: person icon, name, and country
                Section("Authors"){
                        // Your code here
                    }
                    // TODO 5: Create "Navigation Info" section
                    // Display current path count
                Section("Navigation Info"){
                    //Your code here
                }
            }
                .navigationTitle("Library")
                // TODO 6: Add navigationDestination for Book.self
                // Navigate to BookDetailView
                
                // TODO 7: Add navigationDestination for Author.self
                // Navigate to AuthorDetailView
                
           
        
    }
}

#Preview {
    ContentView()
}

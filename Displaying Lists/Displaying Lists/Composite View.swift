//
//  Composite View.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

enum Genre: String {
    case mystery = "Mystery"
    case horror = "Horror"
    case fantasy = "Fantasy"
    case scifi = "Science Fiction"
    case thriller = "Thriller"
}

struct Bok: Identifiable {
    let name: String
    let id = UUID()
    let author: String
    let genre: Genre
    let coverImage: String
}

struct Composite_View: View {
    var boooks: [Bok] = [
            Bok(
                name: "Normal People",
                author: "Sally Rooney",
                genre: .mystery,
                coverImage: "Image"
            ),
            Bok(
                name: "The Girl with the Dragon Tattoo",
                author: "Stieg Larsson",
                genre: .thriller,
                coverImage: "Image"
            ),
            Bok(
                name: "The Golden Notebook",
                author: "Doris Lessing",
                genre: .mystery,
                coverImage: "Image"
            ),
            Bok(
                name: "Life of Pi",
                author: "Yann Martel",
                genre: .fantasy,
                coverImage: "Image"
            ),
            Bok(
                name: "The Alchemist",
                author: "Paulo Coelho",
                genre: .fantasy,
                coverImage: "Image"
            ),
            Bok(
                name: "The Hobbit",
                author: "J.R.R. Tolkien",
                genre: .fantasy,
                coverImage: "Image"
            ),
            Bok(
                name: "The Martian",
                author: "Andy Weir",
                genre: .scifi,
                coverImage: "Image"
            ),
            Bok(
                name: "1984",
                author: "George Orwell",
                genre: .scifi,
                coverImage: "Image"
            ),
            Bok(
                name: "2001: A Space Odyssey",
                author: "Arthur C. Clarke",
                genre: .scifi,
                coverImage: "Image"
            ),
            Bok(
                name: "I, Robot",
                author: "Isaac Asimov",
                genre: .scifi,
                coverImage: "Image"
            )
        ]
    var body: some View {
        List(boooks) { book in
            Book_list_row_View(boook: book)
        }
        
    }
}

#Preview {
    Composite_View()
}

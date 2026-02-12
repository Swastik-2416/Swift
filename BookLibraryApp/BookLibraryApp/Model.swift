//
//  Model.swift
//  BookLibraryApp
//
//  Created by Dr. Vinod Kumar on 29/01/26.
//

import Foundation

import SwiftUI

struct Book: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let authorName: String
    let pages: Int
}

struct Author: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let country: String
}

class LibraryModel {
    var books: [Book] = []
    var authors: [Author] = []
    
    init() {
        authors = [
            Author(name: "J.K. Rowling", country: "United Kingdom"),
            Author(name: "George Orwell", country: "United Kingdom"),
            Author(name: "Jane Austen", country: "United Kingdom")
        ]
        
        books = [
            Book(title: "Harry Potter and the Philosopher's Stone", authorName: "J.K. Rowling", pages: 223),
            Book(title: "Harry Potter and the Chamber of Secrets", authorName: "J.K. Rowling", pages: 251),
            Book(title: "1984", authorName: "George Orwell", pages: 328),
            Book(title: "Animal Farm", authorName: "George Orwell", pages: 112),
            Book(title: "Pride and Prejudice", authorName: "Jane Austen", pages: 432),
            Book(title: "Sense and Sensibility", authorName: "Jane Austen", pages: 409)
        ]
    }
    
    func getAuthor(byName name: String) -> Author? {
        return authors.first { $0.name == name }
    }
    
    func getBooks(byAuthor authorName: String) -> [Book] {
        return books.filter { $0.authorName == authorName }
    }
}

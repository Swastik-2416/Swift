//
//  Book list row View.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct Book_list_row_View: View {
    var boook: Bok
    var body: some View {
        
        VStack {
            HStack {
                Image(boook.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 1000)
                    .cornerRadius(20)
                    .padding(5)
                VStack(alignment: .leading) {
                    Text(boook.name)
                        .font(.headline)
                    Text(boook.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(boook.genre.rawValue)
                        .padding(5)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Spacer()
            }
            .frame(width: 380 ,height: 100)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
        }
    }
}

#Preview {
    Book_list_row_View(boook:Bok(
        name: "2001: A Space Odyssey",
        author: "Arthur C. Clarke",
        genre: .scifi,
        coverImage: "Image"))
}

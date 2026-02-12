//
//  DataModel.swift
//  Notes
//
//  Created by Swastik Mandal on 19/01/26.
//

import Foundation

struct Note: Identifiable {
    var id: String {
        title+subtitle+description
    }
    var title: String
    var subtitle: String
    var description: String
}
struct Notes {
    static let notes: [Note] = [
        Note(title: "First Note", subtitle: "Subtitle 1", description: "Description 1"),
        Note(title: "Second Note", subtitle: "Subtitle 2", description: "Description 2"),
        Note(title: "Third Note", subtitle: "Subtitle 3", description: "Description 3"),
        Note(title: "Fourth Note", subtitle: "Subtitle 4", description: "Description 4"),
        Note(title: "Fifth Note", subtitle: "Subtitle 5", description: "Description 5"),
    ]
}

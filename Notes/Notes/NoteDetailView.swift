//
//  NoteDetailView.swift
//  Notes
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    var body: some View {
        List {
            Text(note.subtitle)
            Text(note.description)
                .listRowSeparator(.hidden)
        }
        .navigationTitle(note.title)
        
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note:Notes.notes[0])
    }
}

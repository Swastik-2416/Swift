//
//  ContentView.swift
//  Notes
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct NoteListView: View {
    var notes: [Note] = Notes.notes
    var body: some View {
        List {
            ForEach(notes) { note in
                NavigationLink {
                    NoteDetailView(note: note)
                    
                } label: {
                    NodeCardView(note: note)
                }
            }
        }
        .navigationTitle("My Notes")
    }
}

#Preview {
    NavigationStack {
        NoteListView()
    }
}

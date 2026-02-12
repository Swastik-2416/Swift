//
//  NodeCardView.swift
//  Notes
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct NodeCardView: View {
    var note: Note
    var body: some View {
        HStack{
            Image(systemName: "rectangle.fill")
                .font(.largeTitle)
            VStack {
                Text(note.title)
                    .font(.headline)
                Text(note.subtitle)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    NodeCardView(note: Notes.notes[0])
}

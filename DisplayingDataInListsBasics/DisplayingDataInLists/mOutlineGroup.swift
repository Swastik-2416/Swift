//
//  mOutlineGroup.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

// MARK: OutlineGroup is a SwiftUI view that displays hierarchical/tree-structured data with automatic expand/collapse functionality. It's perfect for file systems, organizational charts, or any nested data

import SwiftUI

struct Folder: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let subFolders: [Folder]?
}

struct mOutlineGroup: View {
    let folders: [Folder] = [
        Folder(
            name: "Folder 1",
            icon: "document",
            subFolders: nil
        ),
        Folder(
            name: "Folder 2",
            icon: "folder",
            subFolders: [
                Folder(
                    name: "Subfolder 2 1",
                    icon: "document",
                    subFolders: nil
                )
            ]
        ),
        Folder(
            name: "Folder 3",
            icon: "folder",
            subFolders: [
                Folder(
                    name: "Subfolder 3 1",
                    icon: "folder",
                    subFolders: [
                        Folder(
                            name: "Subfolder 3 1 1",
                            icon: "document",
                            subFolders: nil
                        )
                    ]
                )
            ]
        )
    ]
    
    
    
    var body: some View {
        List(folders, children: \.subFolders) { folder in
            Label(folder.name, systemImage: folder.icon)
        }
    }
    
}

#Preview {
    mOutlineGroup()
}

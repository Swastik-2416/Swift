//
//  ContentView.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 06/01/26.
//

import SwiftUI

struct ContentView: View {
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
    ContentView()
}


//
//  Outline grp.swift
//  Disclosure grps
//
//  Created by GU on 09/01/26.
//

import SwiftUI

struct Folder: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let subFolder: [Folder]?
}
struct Outline_grp: View {
    let folders: [Folder] = [
        Folder(name: "Folder 1", icon: "folder", subFolder: [Folder(name: "Sub Folder 1", icon: "folder", subFolder: nil)]),
        Folder(name: "Folder 2", icon: "folder", subFolder: [Folder(name: "Sub Folder 1", icon: "folder", subFolder: [Folder(name: "Sub Folder 1", icon: "folder", subFolder: nil)])]),
        Folder(name: "Folder 3", icon: "folder", subFolder: nil),
    ]
    var body: some View {
        List(folders, children: \.subFolder) { folder in
            Label(folder.name, systemImage: folder.icon)
        }
    }
}

#Preview {
    Outline_grp()
}

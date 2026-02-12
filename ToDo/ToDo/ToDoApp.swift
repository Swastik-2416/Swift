//
//  ToDoApp.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

@main
struct ToDoApp: App {
    @State private var store = TaskStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}

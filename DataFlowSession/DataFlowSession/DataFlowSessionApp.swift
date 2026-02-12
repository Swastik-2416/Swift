//
//  DataFlowSessionApp.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

@main
struct DataFlowSessionApp: App {
    @State private var book=Book(title: "Sample Title", author: "Sample Author")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(book)
        }
    }
}

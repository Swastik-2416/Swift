//
//  DataFlowProductApp.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

@main
struct DataFlowProductApp: App {
    @State private var cart = Cart()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cart)
        }
    }
}

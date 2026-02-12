//
//  EnvironmentView.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct EnvironmentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Text("Color Scheme: \(colorScheme == .dark ? "Dark" : "Light")")
    }
}

#Preview {
    EnvironmentView()
}

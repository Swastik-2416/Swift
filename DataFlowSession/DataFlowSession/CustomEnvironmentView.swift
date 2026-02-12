//
//  CustomEnvironmentView.swift
//  DataFlowSession
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI
extension EnvironmentValues {
    @Entry var storkeWidth = 10.0
}
struct CustomEnvironmentView: View {
    @Environment(\.storkeWidth) var storkeWidth
    var body: some View {
        ForEach(0..<3){ _ in
            Circle()
                .stroke(.red,lineWidth: storkeWidth)
        }
    }
}

#Preview {
    CustomEnvironmentView()
}

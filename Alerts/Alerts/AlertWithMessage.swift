//
//  AlertWithMessage.swift
//  Alerts
//
//  Created by Swastik Mandal on 30/01/26.
//

import SwiftUI

struct AlertWithMessage: View {
    @State private var showAlert = false
    var body: some View {
        Button("Alert with Message Text") {
            showAlert = true
        }
        .alert(
            "Network Error",
        isPresented: $showAlert,
            actions: {
                Button("Retry"){}
                Button("Cancel", role: .cancel){}
            },
            message: {
                Text("Network error")
            }
        )
    }
}

#Preview {
    AlertWithMessage()
}

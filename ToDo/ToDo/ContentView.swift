//
//  ContentView.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TaskView()
                .tabItem {
                    Label("Task", systemImage: "menucard.fill")
            }
            TaskSummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(TaskStore())
}

//
//  TaskSummaryView.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct TaskSummaryView: View {
    @Environment(TaskStore.self) private var store
    var body: some View {
        NavigationStack {
                   VStack(spacing: 12) {

                       Text("Task Summary")
                           .font(.title2)
                           .bold()

                       Text("Total Tasks: \(store.tasks.count)")

                       Text("Completed Tasks: \(store.tasks.filter { $0.isCompleted }.count)")
                   }
                   .padding()
                   .navigationTitle("Summary")
               }
    }
}

#Preview {
    TaskSummaryView()
        .environment(TaskStore())
}

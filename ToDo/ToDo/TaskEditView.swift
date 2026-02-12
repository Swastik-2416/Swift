//
//  TaskEditView.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct TaskEditView: View {
    @Environment(TaskStore.self) private var store
        let task: Task
    var body: some View {
        Form {
            Section {
                Text(task.title).font(.title)

                Toggle(
                    "Completed",
                    isOn: Binding(
                        get: { task.isCompleted },
                        set: { _ in
                            store.toggleTask(task)
                        }
                       )
                 )
               }
            }
            .navigationTitle("Edit Task")
    }
}

#Preview {
    TaskEditView(task: Task(title: "Grocery"))
        .environment(TaskStore())
}

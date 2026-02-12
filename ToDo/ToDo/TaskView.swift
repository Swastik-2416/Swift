//
//  TaskView.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct TaskView: View {
    @Environment(TaskStore.self) private var store
    @State private var newTaskTitle = ""

        var body: some View {
            NavigationStack {
                VStack(spacing: 16) {
                    HStack {
                        TextField("Today's Task", text: $newTaskTitle)
                                                .textFieldStyle(.roundedBorder)

                        Button("Add") {
                            store.addTask(title: newTaskTitle)
                            newTaskTitle=""
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.horizontal)

                    
                    List {
                        ForEach(store.tasks) { task in
                            NavigationLink {
                                TaskEditView(task: task)
                            } label: {
                                HStack {
                                    Text(task.title)

                                    Spacer()

                                    Toggle(
                                        "",
                                        isOn: Binding(
                                            get: { task.isCompleted },
                                            set: { _ in
                                                store.toggleTask(task)
                                            }
                                        )
                                    )
                                    .labelsHidden()
                                }
                            }
                        }

                    }
                    .listStyle(.insetGrouped)
                }
                .navigationTitle("Tasks")
            }
        }

}

#Preview {
    TaskView()
        .environment(TaskStore())
}

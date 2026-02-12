//
//  DataModel.swift
//  ToDo
//
//  Created by Anushka Sharma on 12/01/26.
//

import Foundation

@Observable
class Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.title = title
    }
}

@Observable
class TaskStore {

    var tasks: [Task] = []

    func addTask(title: String) {
        if title.isEmpty { return }
        tasks.append(Task(title: title))
    }

    func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].isCompleted.toggle()
            }
    }
}

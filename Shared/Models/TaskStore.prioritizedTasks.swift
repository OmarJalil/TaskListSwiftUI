//
//  TaskStore.prioritizedTasks.swift
//  TaskList
//
//  Created by Omar on 31/07/20.
//

extension TaskStore {
    struct PrioritizedTasks {
        var priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable {
    var id: Task.Priority { priority }
}

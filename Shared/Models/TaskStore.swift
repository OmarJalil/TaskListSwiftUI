//
//  TaskStore.swift
//  Shared
//
//  Created by Omar on 31/07/20.
//
import Combine

class TaskStore: ObservableObject {
    
    @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .high,
            names: [
                "Code a SwiftUI app",
                "Become fluent in a new language",
                "Take an archery class",
                "Take up knitting or crocheting"
            ]),
        
        PrioritizedTasks(
            priority: .medium,
            names: [
                "Try an extreme sport",
                "Learn how to play an instrument",
            ]),
        
        PrioritizedTasks(
            priority: .low,
            names: [
                "Try to learn a martial art",
                "Wake up to see the sunrise every day for a week",
            ]),
        
        PrioritizedTasks(
            priority: .no,
            names: [
                "Attend the Olympics"
            ])
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex {
            $0.priority == priority
        }!
    }

    
}

private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map { Task(name: $0) }
        )
    }
}

//
//  SectionView.swift
//  TaskList
//
//  Created by Omar on 31/07/20.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    
    var body: some View {
        Section(
            header: Text("\(prioritizedTasks.priority.rawValue.capitalized) Priority")
        ) {
            ForEach(prioritizedTasks.tasks) { index in
                RowView(task: $prioritizedTasks.tasks[index])
            }
            .onMove { indecies, newOffset in
                prioritizedTasks.tasks.move(fromOffsets: indecies, toOffset: newOffset)
            }
            .onDelete { indexSet in
                prioritizedTasks.tasks.remove(atOffsets: indexSet)
            }
        }
        
    }
}

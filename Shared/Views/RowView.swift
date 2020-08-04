//
//  RowView.swift
//  TaskList
//
//  Created by Omar on 31/07/20.
//

import SwiftUI

struct RowView: View {
    @Binding var task: Task
    
    let checkMark = Image(systemName: "checkmark")
    var body: some View {
        NavigationLink(destination: TaskEditingView(task: $task)) {
            if task.completed {
                checkMark
            } else {
                checkMark.hidden()
            }
            Text(task.name).strikethrough(task.completed)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(task: .constant(Task(name: "To Do")) )
    }
}

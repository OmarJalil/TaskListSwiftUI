//
//  NewTaskView.swift
//  TaskList
//
//  Created by Omar on 31/07/20.
//

import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    @State var text = ""
    @State var priority: Task.Priority = .low
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            VStack {
                Text("Priority")
                    .font(.largeTitle)
                Picker("Priority", selection: $priority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) { priorityIndex in
                        Text(Task.Priority.allCases[priorityIndex].rawValue.capitalized)
                            .tag(priorityIndex)
                    }
                }
                .pickerStyle( SegmentedPickerStyle() )
            }
            TextField("Text Name", text: $text)
            Button("Add") {
                addNewTask()
            }.disabled(text.isEmpty)
        }
    }
    
    func addNewTask() {
        let priorityIndex = taskStore.getIndex(for: priority)
        self.taskStore.prioritizedTasks[priorityIndex].tasks.append(Task(name: text))
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}

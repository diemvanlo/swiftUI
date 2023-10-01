//
//  ContentView.swift
//  DragAndDropStarter
//
//  Created by Sean Allen on 7/18/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var toDoTasks: [DeveloperTask] = DeveloperTask.mockData
    @State private var inProgressTasks: [DeveloperTask] = []
    @State private var doneTasks: [DeveloperTask] = []
    @State private var currentSelectedKanban: KanbanType? = nil
    
    var body: some View {
        HStack(spacing: 12) {
            KanbanView(title: "To Do", tasks: toDoTasks, type: .todo, selectedType: currentSelectedKanban)
                .dropDestination(for: DeveloperTask.self) { droppedTask, location in
                    return removeAtOther(currentTaskZone: &toDoTasks, taksZone1: &inProgressTasks, taskZone2: &doneTasks, droppedTask: droppedTask)
                } isTargeted: { isTargeted in
                    currentSelectedKanban = isTargeted ? .todo : nil
                }
            KanbanView(title: "In Progress", tasks: inProgressTasks, type: .inprogress, selectedType: currentSelectedKanban)
                .dropDestination(for: DeveloperTask.self) { droppedTask, location in
                    return removeAtOther(currentTaskZone: &inProgressTasks, taksZone1: &toDoTasks, taskZone2: &doneTasks, droppedTask: droppedTask)
                } isTargeted: { isTargeted in
                    currentSelectedKanban = isTargeted ? .inprogress : nil
                }
            KanbanView(title: "Done", tasks: doneTasks, type: .done, selectedType: currentSelectedKanban)
                .dropDestination(for: DeveloperTask.self) { droppedTask, location in
                    return removeAtOther(currentTaskZone: &doneTasks, taksZone1: &toDoTasks, taskZone2: &inProgressTasks, droppedTask: droppedTask)
                } isTargeted: { isTargeted in
                    currentSelectedKanban = isTargeted ? .done : nil
                }
        }
        .padding()
    }
    
    func removeAtOther(currentTaskZone: inout [DeveloperTask], taksZone1: inout [DeveloperTask], taskZone2: inout [DeveloperTask], droppedTask: [DeveloperTask]) -> Bool {
        let droppedTaskSet = Set(droppedTask)
        let isCurrentContainTask = currentTaskZone.contains(where: { droppedTaskSet.contains($0) })
        guard !isCurrentContainTask else { return false }
        
        taksZone1.removeAll { droppedTaskSet.contains($0) }
        taskZone2.removeAll { droppedTaskSet.contains($0) }
        currentTaskZone.append(contentsOf: droppedTask)
        
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

enum KanbanType {
    case todo, inprogress, done
}

struct KanbanView: View {
    let title: String
    let tasks: [DeveloperTask]
    let type: KanbanType
    var selectedType: KanbanType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(type == selectedType ? .teal.opacity(0.15) : Color(.secondarySystemFill))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}

struct DeveloperTask: Codable, Transferable, Equatable, Hashable {
    var id: UUID
    let title: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .developTask)
    }
    
    static let mockData: [DeveloperTask] = {
        let tasks = ["@Observable Migration", "Keyframe Animations", "Migrate to Swift Data"]
        return tasks.map { DeveloperTask(id: UUID(), title: $0) }
    }()
    
    static func == (lhs: DeveloperTask, rhs: DeveloperTask) -> Bool {
        return lhs.title == rhs.title
    }
}

extension UTType {
    static let developTask = UTType(exportedAs: "liem.ldv")
}

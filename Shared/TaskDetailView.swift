//
//  TaskDetailView.swift
//  SwiftUITasks
//
//  Created by Radek Vala on 03.12.2021.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task:Task
    @State private var stateCompleted: Bool
    
    
    init(currentTask:Task){
       
        self.task = currentTask
        if currentTask.finished == "yes" {
            stateCompleted = true
            print(currentTask.finished!)
        } else {
            stateCompleted = false
        }
        
    }
    
    var body: some View {
        
        VStack {
            Text("\(task.name ?? "Name not set")")
                .font(.title)
            
            Spacer()
            
            Text("Item at \(task.timestamp!, formatter: itemFormatter)")
            
            Toggle("Completed", isOn: $stateCompleted )
                
                .onChange(of: stateCompleted) { value in
                    viewContext.performAndWait {
                        print("update")
                        if value {
                            task.finished = "yes"
                        } else {
                            task.finished = "no"
                        }
                        
                        try? viewContext.save()
                }
                }
            
            Spacer()
            Spacer()
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

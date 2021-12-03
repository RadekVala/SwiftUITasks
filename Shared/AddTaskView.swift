//
//  AddTaskView.swift
//  SwiftUITasks
//
//  Created by Radek Vala on 03.12.2021.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var name: String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Task name")
                TextField("Buy a chocolate", text: $name)
            }.padding()
            
            Spacer()
            Spacer()
            
            Button(action: buttonAddTapped) {
                Text("Add Task")
            }
            
        }

    }
    
    private func buttonAddTapped(){
        print("add task")
        
        let newItem = Task(context: viewContext)
        newItem.name = name
        newItem.timestamp = Date()
        newItem.completed = false
        
        do {
            try viewContext.save()
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

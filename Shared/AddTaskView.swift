//
//  AddTaskView.swift
//  SwiftUITasks
//
//  Created by Radek Vala on 03.12.2021.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var isPresented: Bool
    @State var name: String = ""
    
    var body: some View {
        
        VStack {
            Label("Create a new task", systemImage: "pencil.circle.fill")
                .padding(.vertical)
                
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
        newItem.finished = "yes"
        
        do {
            try viewContext.save()
            isPresented = false
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

//
//  SwiftUITasksApp.swift
//  Shared
//
//  Created by Radek Vala on 03.12.2021.
//

import SwiftUI

@main
struct SwiftUITasksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

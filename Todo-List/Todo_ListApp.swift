//
//  Todo_ListApp.swift
//  Todo-List
//
//  Created by Eslam Gamal on 30/09/2025.
//

import SwiftUI
import SwiftData
@main
struct Todo_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:ToDoItem.self)
        }
    }
}

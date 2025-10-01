//
//  CreateTodoView.swift
//  Todo-List
//
//  Created by Eslam Gamal on 30/09/2025.
//

import SwiftUI
import SwiftData

struct CreateTodoView:View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = ToDoItem()
    
    var body: some View {
        List{
        
            TextField("Name ",text:$item.title)
            DatePicker("Choose a date",selection: $item.timestamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Create"){
                withAnimation{
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationBarTitle("Create Todo")
    }
}

#Preview {
    CreateTodoView()
        .modelContainer(for:ToDoItem.self)
}

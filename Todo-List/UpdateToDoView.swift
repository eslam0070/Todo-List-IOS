//
//  UpdateToDoView.swift
//  Todo-List
//
//  Created by Eslam Gamal on 30/09/2025.
//

import SwiftUI
import SwiftData

struct UpdateToDoView : View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var item : ToDoItem

    
    var body: some View {
        List{
        
            TextField("Name ",text:$item.title)
            DatePicker("Choose a date",selection: $item.timestamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Update"){
                dismiss()
            }
        }
        .navigationBarTitle("Update Todo")
    }
}

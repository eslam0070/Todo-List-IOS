//
//  ContentView.swift
//  Todo-List
//
//  Created by Eslam Gamal on 30/09/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showCreate = false
    @Query(
        filter: #Predicate<ToDoItem> { item in
            item.isComplete == false
        },
        sort: \.timestamp,
        order: .reverse
    ) private var items: [ToDoItem]
    @State private var toDoEdit: ToDoItem?
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack{
            List{
                ForEach(items){item in
                    HStack{
                        VStack(alignment: .leading){
                            if item.isCritical{
                                Image(systemName: "exclamationmark.3"
                                ).symbolVariant(.fill)
                                    .foregroundColor(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(item.timestamp.formatted(date: .numeric, time: .shortened))
                                .font(.callout)
                            
                            
                        }
                        
                        Spacer()
                        Button{
                            item.isComplete.toggle()
                        }label:{
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundColor(
                                    item.isComplete ? .green :  .gray
                                )
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions{
                        Button(role:.destructive){
                        context.delete(item)
                    }label:{
                        Label("Delete",systemImage:"trash")
                            .symbolVariant(.fill)
                    }
                        
                        Button{
                            toDoEdit = item
                    }label:{
                        Label("Edit",systemImage:"pencli")
                    }
                    .tint(.orange)
                        
                    }
                    
                }
            }
            .navigationBarTitle("My To do List")
            .toolbar{
                    ToolbarItem{
                        Button(action:{
                            showCreate.toggle()
                        },label: {
                            Label("Add Item",systemImage:"plus")
                        })
                    }
                }.sheet(isPresented: $showCreate, content: {
                    NavigationStack{
                        CreateTodoView()
                    }
                    .presentationDetents([.medium])
                })
            
                .sheet(item:$toDoEdit){
                    toDoEdit = nil
                } content:{ item in
                    UpdateToDoView(item: item)
                }
        }
    
    }
}

#Preview {
    ContentView()
}

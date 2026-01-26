//
//  ContentView.swift
//  To-Do list
//
//  Created by daniell Escareno on 1/20/26.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoList = ToDoList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList.items) { item in
                    HStack{
                        VStack(alignment: .leading, content: {
                            Text(item.priority).font(.headline)
                            Text(item.description)
                        })
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { IndexSet in
                    toDoList.items.remove(atOffsets: IndexSet)
                })
            }
            .sheet(isPresented: $showingAddItemView) {
                AddItemView()
                    .environment(toDoList)
            }
            .navigationBarTitle("To do list", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddItemView = true
            }, label: {
                Image(systemName: "plus")
            }))
            
        }
    }
}
#Preview {
    ContentView()
}
struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
    
}

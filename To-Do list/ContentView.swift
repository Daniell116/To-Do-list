//
//  ContentView.swift
//  To-Do list
//
//  Created by daniell Escareno on 1/20/26.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoItems =
    [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
     ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
     ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoItems) { item in
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
                        toDoItems.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { IndexSet in
                        toDoItems.remove(atOffsets: IndexSet)
                    })
                }
                .navigationBarTitle("To do list", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
            
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

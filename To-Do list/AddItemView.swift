//
//  AddItemView.swift
//  To-Do list
//
//  Created by daniell Escareno on 1/23/26.
//

import SwiftUI

struct AddItemView: View {
    @Environment(ToDoList.self) var toDoList
    @Environment(\.dismiss) var dismiss
    static let priorities = ["High", "Medium", "low"]
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                    Text(priority)
                    }
                }
            }
        }
    }
}

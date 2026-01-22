//
//  ContentView.swift
//  To-Do list
//
//  Created by daniell Escareno on 1/20/26.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First thing", "Second thing" ,"Third thing" ,"Fourth thing", "Fifth thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { item in
                    Text(item.description)
                }
                .onMove(perform: { indices, newOffset in
                    things.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { IndexSet in
                    things.remove(atOffsets: IndexSet)
                })
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}
#Preview {
    ContentView()
}

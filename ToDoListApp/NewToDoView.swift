//
//  NewToDoView.swift
//  ToDoListApp
//
//  Created by Susan Varghese on 6/14/23.
//

import SwiftUI

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Binding var toDoItems: [ToDoItem]
    @State var title: String
    @State var isImportant: Bool
    
    var body: some View {
        VStack {
            Text("Add new task")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter the task description", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $isImportant){
                Text("Important?")
            }
            .padding()
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
            }
            .padding()
            
        }
    }
    
    private func addTask(title: String, isImportant: Bool = false){
        let task = ToDoItem(title: title, isImportant: isImportant)
        toDoItems.append(task)
    }
    
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(showNewTask: .constant(true), toDoItems: .constant([]), title: "", isImportant: false )
    }
}

//
//  NewAssignmentView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/22/24.
//

import SwiftUI

struct NewAssignmentView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var course: String = ""
    @State private var assignmentType: String = ""
    @State private var completed: Bool = false
    
    var body: some View {
        VStack{
            Text("New Assignment")
                .font(.title)
                .bold()
                .padding()
            
            TextField("Assignment Name", text: $title)
                .padding()
            TextField("Assignment Description", text: $description)
                .padding()
            DatePicker("Assignment Due Date", selection: $dueDate)
                .padding()
            TextField("Course", text: $course)
                .padding()
            TextField("Assignment Type", text: $assignmentType)
                .padding()
            Toggle("Completed", isOn: $completed)
                .padding()
        }
    }
}

#Preview {
    NewAssignmentView()
}

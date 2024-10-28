//
//  AssignmentDetailView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import SwiftUI

struct AssignmentDetailView: View {
    @EnvironmentObject var assignmentViewModel: AssignmentViewModel
    @Binding var assignment: Assignment
    
    // Temporary state variables for editing
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var course: String = ""
    @State private var assignmentType: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Assignment Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    TextField("Course", text: $course)
                    TextField("Assignment Type", text: $assignmentType)
                }
            }
            .navigationTitle("Edit Assignment")
            .onAppear {
                // Populate fields with current assignment data
                title = assignment.title
                description = assignment.description ?? ""
                dueDate = assignment.dueDate
                course = assignment.course
                assignmentType = assignment.assignmentType
            }
            .onDisappear {
                saveChanges()
            }
        }
    }
    
    private func saveChanges() {
        assignment.title = title
        assignment.description = description
        assignment.dueDate = dueDate
        assignment.course = course
        assignment.assignmentType = assignmentType
        assignmentViewModel.addOrUpdateAssignment(assignment)
    }
}

struct AssignmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAssignment = Assignment(
            id: UUID().uuidString,
            title: "Sample Assignment",
            description: "This is a sample description.",
            dueDate: Date(),
            course: "Sample Course",
            assignmentType: "Test",
            completed: false
        )
        AssignmentDetailView(assignment: .constant(sampleAssignment))
            .environmentObject(AssignmentViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

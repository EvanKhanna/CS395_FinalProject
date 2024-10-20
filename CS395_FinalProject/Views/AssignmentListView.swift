//
//  AssignmentListView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import SwiftUI

struct AssignmentListView: View {
    @State private var assignments: [Assignment] = [
        Assignment(title: "Math Homework", description: "Chapter 2 Exercises", dueDate: Date(), course: "Math", assignmentType: "Homework"),
        Assignment(title: "English Essay", description: "Write an essay on Shakespeare", dueDate: Date().addingTimeInterval(86400), course: "English", assignmentType: "Essay"),
    ]
    
    var body: some View {
        NavigationView {
            List(assignments) { assignment in
                NavigationLink(destination: AssignmentDetailView(assignment: $assignments[getIndex(of: assignment)])) {
                    AssignmentRow(assignment: assignment)
                }
            }
            .navigationTitle("Assignments")
        }
    }
    
    // Helper function to get the index of an assignment
    private func getIndex(of assignment: Assignment) -> Int {
        return assignments.firstIndex(where: { $0.id == assignment.id }) ?? 0
    }
}

struct AssignmentRow: View {
    var assignment: Assignment

    var body: some View {
        HStack {
            Text(assignment.title)
                .strikethrough(assignment.completed, color: .gray)
                .foregroundColor(assignment.completed ? .gray : .black)
            
            Spacer()
            
            Text(assignment.dueDate, style: .date)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

#Preview {
    AssignmentListView()
}

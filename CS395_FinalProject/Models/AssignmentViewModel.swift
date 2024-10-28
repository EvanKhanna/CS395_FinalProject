//
//  AssignmentViewModel.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/27/24.
//

import Foundation

class AssignmentViewModel: ObservableObject {
    @Published var assignments: [Assignment] = Assignment.getAssignments()
    
    func addOrUpdateAssignment(_ assignment: Assignment) {
            if let index = assignments.firstIndex(where: { $0.id == assignment.id }) {
                assignments[index] = assignment
            } else {
                assignments.append(assignment)
            }
            saveAssignments()
        }

        private func saveAssignments() {
            Assignment.save(assignments)
        }
}

//
//  AssignmentViewModel.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/27/24.
//

import Foundation

class AssignmentViewModel: ObservableObject {
    @Published var assignments: [Assignment] = Assignment.getAssignments()
    
    init() {
            loadAssignments()
        }

    func loadAssignments() {
        // Fetches assignments from storage and updates the assignments array
        assignments = Assignment.getAssignments()
    }
    
    func deleteAssignment(_ assignment: Assignment) {
            assignments.removeAll { $0.id == assignment.id }
            saveAssignments()
        }
    
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

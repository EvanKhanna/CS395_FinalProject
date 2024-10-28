//
//  AssignmentViewModel.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/27/24.
//

import Foundation

class AssignmentViewModel: ObservableObject {
    @Published var assignments: [Assignment] = Assignment.getAssignments()
}

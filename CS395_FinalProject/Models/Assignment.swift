//
//  Assignment.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import Foundation

struct Assignment: Identifiable, Codable {
    let id: String
    var title: String
    var description: String?
    var dueDate: Date
    var course: String
    var assignmentType: String
    var completed: Bool = false
    var createdDate: Date

    init(id: String = UUID().uuidString, title: String, description: String? = nil, dueDate: Date = Date(), course: String, assignmentType: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.course = course
        self.assignmentType = assignmentType
        self.completed = completed
        self.createdDate = Date()
    }
}

extension Assignment {
    static func save(_ assignments: [Assignment]) {
        let data = try? JSONEncoder().encode(assignments)
        UserDefaults.standard.set(data, forKey: "Assignments")
    }

    static func getAssignments() -> [Assignment] {
        guard let data = UserDefaults.standard.data(forKey: "Assignments"),
              let assignments = try? JSONDecoder().decode([Assignment].self, from: data) else {
            return []
        }
        return assignments
    }
}

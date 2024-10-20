//
//  Assignment.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import Foundation

struct Assignment: Identifiable{
    let id = UUID()
    
    var title: String
    var description: String?
    var dueDate: Date
    var course: String
    var assignmentType: String
    var completed: Bool = false
}

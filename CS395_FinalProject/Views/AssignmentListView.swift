//
//  AssignmentListView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import SwiftUI

struct AssignmentListView: View {
    @StateObject private var viewModel = AssignmentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.assignments) { assignment in
                NavigationLink(destination: AssignmentDetailView(assignment: $viewModel.assignments[getIndex(of: assignment)])) {
                    AssignmentRow(assignment: assignment)
                }
            }
            .navigationTitle("Assignments")
        }
    }
    
    private func getIndex(of assignment: Assignment) -> Int {
        return viewModel.assignments.firstIndex(where: { $0.id == assignment.id }) ?? 0
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

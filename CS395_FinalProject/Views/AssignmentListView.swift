//
//  AssignmentListView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import SwiftUI

enum AssignmentFilter: String, CaseIterable, Identifiable {
    case course = "Course"
    case type = "Type"
    case dueDate = "Due Date"
    
    var id: String { self.rawValue }
}

struct AssignmentListView: View {
    @EnvironmentObject var assignmentViewModel: AssignmentViewModel
    @State private var selectedFilter: AssignmentFilter = .dueDate  // Default filter
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(filteredAssignments) { assignment in
                            NavigationLink(
                                destination: AssignmentDetailView(assignment: $assignmentViewModel.assignments[getIndex(of: assignment)])
                            ) {
                                AssignmentRow(assignment: assignment)
                            }
                        }
                        .onDelete(perform: deleteAssignment)  // Enable swipe-to-delete
                    }
            .navigationTitle("Assignments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        ForEach(AssignmentFilter.allCases) { filter in
                            Button(action: { selectedFilter = filter }) {
                                Text("Sort by \(filter.rawValue)")
                            }
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
        }
        .onAppear {
            assignmentViewModel.loadAssignments()  // Reload assignments when view appears
        }
    }
    
    private var filteredAssignments: [Assignment] {
        switch selectedFilter {
        case .course:
            return assignmentViewModel.assignments.sorted { $0.course < $1.course }
        case .type:
            return assignmentViewModel.assignments.sorted { $0.assignmentType < $1.assignmentType }
        case .dueDate:
            return assignmentViewModel.assignments.sorted { $0.dueDate < $1.dueDate }
        }
    }
    
    private func deleteAssignment(at offsets: IndexSet) {
            for index in offsets {
                let assignment = filteredAssignments[index]
                assignmentViewModel.deleteAssignment(assignment)
            }
        }
    
    private func getIndex(of assignment: Assignment) -> Int {
        return assignmentViewModel.assignments.firstIndex(where: { $0.id == assignment.id }) ?? 0
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

struct AssignmentListView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentListView()
            .environmentObject(AssignmentViewModel())
    }
}

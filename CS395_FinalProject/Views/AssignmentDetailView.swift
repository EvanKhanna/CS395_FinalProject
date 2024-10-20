//
//  AssignmentDetailView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/20/24.
//

import SwiftUI

struct AssignmentDetailView: View {
    @Binding var assignment: Assignment
    
    var body: some View {
        VStack(spacing: 20) {
            Text(assignment.title)
                .font(.largeTitle)
                .padding(.top)
            
            Text(assignment.description ?? "No description available")
                .padding()
            
            Text("Due: \(assignment.dueDate, style: .date)")
            
            Button(action: {
                assignment.completed.toggle()
            }) {
                Text(assignment.completed ? "Mark as Incomplete" : "Mark as Completed")
                    .foregroundColor(.white)
                    .padding()
                    .background(assignment.completed ? Color.green : Color.red)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Assignment Details")
    }
}

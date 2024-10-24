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

struct AssignmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAssignment = Assignment(
            id: UUID().uuidString,
            title: "Sample Assignment",
            description: "This is a sample description.",
            dueDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
            course: "Sample Course",
            assignmentType: "Test",
            completed: false
        )
        AssignmentDetailView(assignment: .constant(sampleAssignment))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

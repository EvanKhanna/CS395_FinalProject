import SwiftUI

struct AssignmentCalendarView: View {
    @State private var assignments: [Assignment] = Assignment.getAssignments()
    @State private var selectedDate: Date = Date()
    @State private var showingComposeView: Bool = false
    @State private var assignmentToEdit: Assignment? = nil

    private var datesWithAssignments: Set<Date> {
        let calendar = Calendar.current
        var dates: Set<Date> = []
        for assignment in assignments {
            let dueDate = calendar.startOfDay(for: assignment.dueDate)
            dates.insert(dueDate)
        }
        return dates
    }

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                List(assignmentsForSelectedDate()) { assignment in
                    AssignmentRow(assignment: assignment)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            assignmentToEdit = assignment
                            showingComposeView = true
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Assignments Calendar")
            .navigationBarItems(trailing: Button(action: {
                assignmentToEdit = nil
                showingComposeView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingComposeView) {
                AssignmentComposeView(assignmentToEdit: $assignmentToEdit, onSave: { savedAssignment in
                    if let index = assignments.firstIndex(where: { $0.id == savedAssignment.id }) {
                        assignments[index] = savedAssignment
                    } else {
                        assignments.append(savedAssignment)
                    }
                    Assignment.save(assignments)
                })
            }
            .onAppear(perform: refreshAssignments)
        }
    }

    private func refreshAssignments() {
        assignments = Assignment.getAssignments().filter { assignment in
            Calendar.current.isDate(assignment.dueDate, inSameDayAs: selectedDate)
        }
    }

    private func assignmentsForSelectedDate() -> [Assignment] {
        let calendar = Calendar.current
        return assignments.filter { assignment in
            calendar.isDate(assignment.dueDate, inSameDayAs: selectedDate)
        }
    }

    private func updateAssignment(_ updatedAssignment: Assignment) {
        if let index = assignments.firstIndex(where: { $0.id == updatedAssignment.id }) {
            assignments[index] = updatedAssignment
        } else {
            assignments.append(updatedAssignment)
        }
        Assignment.save(assignments)
        refreshAssignments()
    }

}

struct AssignmentCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentCalendarView()
    }
}

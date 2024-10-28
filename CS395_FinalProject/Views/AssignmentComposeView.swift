import SwiftUI

struct AssignmentComposeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var assignmentViewModel: AssignmentViewModel
    @Binding var assignmentToEdit: Assignment?
    var onSave: (Assignment) -> Void
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var course: String = ""
    @State private var assignmentType: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Assignment Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    TextField("Course", text: $course)
                    TextField("Assignment Type", text: $assignmentType)
                }
            }
            .navigationTitle(assignmentToEdit == nil ? "New Assignment" : "Edit Assignment")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Done") {
                    if !title.isEmpty {
                        let newAssignment = Assignment(
                            title: title,
                            description: description,
                            dueDate: dueDate,
                            course: course,
                            assignmentType: assignmentType
                        )
                        onSave(newAssignment)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
            .onAppear {
                if let assignment = assignmentToEdit {
                    title = assignment.title
                    description = assignment.description ?? ""
                    dueDate = assignment.dueDate
                    course = assignment.course
                    assignmentType = assignment.assignmentType
                }
            }
        }
    }
}

struct AssignmentComposeView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentComposeView(
            assignmentToEdit: .constant(nil),
            onSave: { assignment in
                print("Assignment saved: \(assignment.title)")
            }
        )
        .previewLayout(.sizeThatFits)
    }
}


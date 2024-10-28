//
//  MainView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/22/24.
//

import SwiftUI

struct MainView: View {
    @State private var isPresentingNewAssignment: Bool = false
    
    var body: some View {
        TabView {
            AssignmentListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Assignments")
                }

            AssignmentComposeView(assignmentToEdit: .constant(nil), onSave: { assignment in print("Assignment saved: \(assignment.title)")})
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add Assignment")
                }
            AssignmentCalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


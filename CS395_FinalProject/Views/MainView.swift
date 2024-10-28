//
//  MainView.swift
//  CS395_FinalProject
//
//  Created by Evan Khanna on 10/22/24.
//

import SwiftUI

struct MainView: View {
    @State private var isPresentingNewAssignment: Bool = false
    @StateObject private var assignmentViewModel = AssignmentViewModel()
    
    var body: some View {
        TabView {
            AssignmentListView()
                .environmentObject(assignmentViewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Assignments")
                }

            AssignmentComposeView(assignmentToEdit: .constant(nil), onSave: { assignment in assignmentViewModel.addOrUpdateAssignment(assignment)})
                .environmentObject(assignmentViewModel)
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add Assignment")
                }
            AssignmentCalendarView()
                .environmentObject(assignmentViewModel)
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


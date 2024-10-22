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

            Text("Add a new assignment") // Or any placeholder text
                            .tabItem {
                                Image(systemName: "plus.circle")
                                Text("New Assignment")
                            }
                            .onTapGesture {
                                // When the user taps on the "New Assignment" tab, present the modal
                                isPresentingNewAssignment.toggle()
                            }
                            .sheet(isPresented: $isPresentingNewAssignment) {
                                // Present the modal with the new assignment form
                                NewAssignmentView()
                            }
//
//            CalendarView()
//                .tabItem {
//                    Image(systemName: "calendar")
//                    Text("Calendar")
//                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


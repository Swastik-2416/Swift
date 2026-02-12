//
//  ContentView.swift
//  MyDayApp
//
//  Created by GU on 02/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var unreadMessages: String? = "new"
    @State private var isPresented: String? = "3"

    var tasks: [String] = [
            "Complete Swift UI Assignment",
            "Practice Tab View",
            "Submit Project"
        ]

    var body: some View {
        TabView{
            Tab("Today", systemImage: "calendar") {
                Text("Text Overview")
                    .font(.largeTitle)
            }
            Tab("Task", systemImage: "checklist") {
                NavigationStack {
                    List {
                        ForEach(tasks, id: \.self) { task in
                            NavigationLink(task) {
                                Text(task)
                                    .font(.largeTitle)
                            }
                        }
                    }
                    .navigationTitle("My Tasks")
                }
                .onAppear {
                    isPresented = nil
                }
            }
            .badge(isPresented.map{Text($0)})


                    
            Tab("Message", systemImage: "message.fill") {
                NavigationStack {
                    
                }
                .onAppear {
                    unreadMessages = nil
                }
            }
            .badge(unreadMessages.map{Text($0)})
            Tab("Profile", systemImage: "person.crop.circle") {
                NavigationStack {
                    List{
                        HStack{
                            Image(systemName: "person.crop.circle")
                                .font(.largeTitle)
                                .foregroundStyle(Color.blue)
                            VStack{
                                Text("Kiran Singh")
                                    .font(.headline)
                                    .bold()
                                Text("iOS Facilitator")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        NavigationLink("Account Settings") {
                            Text("Account Settings")
                        }
                        NavigationLink("Notifications") {
                            Text("Notifications")
                        }
                        NavigationLink("Help & Support") {
                            Text("Help & Support")
                        }
                        NavigationLink("Sign Out") {
                            Text("Sign Out")
                        }
                    }
                        
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

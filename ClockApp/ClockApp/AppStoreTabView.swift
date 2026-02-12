//
//  AppStoreTabView.swift
//  ClockApp
//
//  Created by GU on 02/02/26.
//

import SwiftUI

struct TodayDetailView: View {
    var body: some View {
        Text("TodayDetailView")
            .navigationTitle("Story")
    }
}
struct ProfileView: View {
    var body: some View {
        Text("ProfileView")
    }
}

struct AppStoreTabView: View {
    @State private var showProfileSheet: Bool = false
    var body: some View {
        VStack {
            TabView {
                Tab("Today", systemImage: "text.rectangle.page.fill") {
                    NavigationStack {
                        List {
                            NavigationLink("Featured Story") {
                                TodayDetailView()
                            }
                        }
                        .navigationTitle(Text("Today"))
                        .toolbar {
                            Button {
                                showProfileSheet = true
                            } label: {
                                Image(systemName: "person.circle.fill")
                            }
                        }
                        .sheet(isPresented: $showProfileSheet) {
                            ProfileView()
                                .presentationDetents([.medium])
                        }
                    }
                }
                Tab("Games" , systemImage:"gamecontroller.fill") {
                    NavigationStack {
                        Text("Games")
                    }
                }
                Tab("Apps", systemImage: "square.stack.3d.up") {
                    NavigationStack {
                        Text("Apps")
                    }
                }
                Tab("Search", systemImage: "magnifyingglass") {
                    NavigationStack {
                        Text("Search")
                    }
                }
            }
        }
    }
}

#Preview {
    AppStoreTabView()
}

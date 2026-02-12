//
//  ContentView.swift
//  ClockApp
//
//  Created by GU on 02/02/26.
//

import SwiftUI

struct ContentView: View {
    enum ClockTab {
        case worldClock
        case alarm
        case stopwatch
    }
    @State private var selectedTab: ClockTab = .alarm
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                Tab ("World Clock", systemImage:"globe.fill", value:.worldClock) {
                        Text("World clock screen")
                    }
                Tab ("Alarm", systemImage: "alarm.fill", value: .alarm) {
                    Text("Alarm screen")
                }
                Tab ("Stopwatch", systemImage: "stopwatch.fill", value: .stopwatch) {
                    Text("Stopwatch screen")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

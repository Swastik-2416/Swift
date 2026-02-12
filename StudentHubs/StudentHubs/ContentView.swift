//
//  ContentView.swift
//  StudentHubs
//
//  Created by GU on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Students")
                .font(.largeTitle)
                .bold()
            Student_View(currentStudent: Student(firstName: "Ravi",lastName: "Sharma", age: 29))
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

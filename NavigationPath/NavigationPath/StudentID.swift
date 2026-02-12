//
//  StudentID.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import SwiftUI

struct StudentID: View {
    @Binding var path: NavigationPath
    let studentID: Int
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .font(.system(size:100))
            Text("Student ID: \(studentID)")
            Divider()
            Text("Current Path: \(path.count)")
                .font(.title2)
        }
        .navigationTitle("Student ID")
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    StudentID(path: $path, studentID:101)
}

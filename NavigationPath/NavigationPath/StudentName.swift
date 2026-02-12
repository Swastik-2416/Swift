//
//  StudentName.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import SwiftUI

struct StudentName: View {
    let studentName: String
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 100))
            Text("Student Name: \(studentName)")
                .font(.title)
        }
    }
}

#Preview {
    StudentName(studentName: "Aman")
}

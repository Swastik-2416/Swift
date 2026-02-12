//
//  StudentDetailView.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import SwiftUI

struct StudentDetailView: View {
    @Binding var path: NavigationPath
    let student: Student
    var body: some View {
        List {
            Section("Student info...") {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.system(size: 100))
                        VStack(alignment: .leading) {
                            Text(student.name)
                                .font(.largeTitle)
                            Text(student.email)
                                .font(.title2)
                        }
                    }
                    .frame(height:150)
                }
            
            }
            Section("Courses Enrolled...") {
                ForEach(student.enrolledCourses) { course in
                    Button(action: {
                        path.append(course)
                    }) {
                        VStack(alignment: .leading) {
                            Text(course.code)
                                .font(.headline)
                            Text(course.title)
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            
        }
        .navigationTitle("Student Detail")
        
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    StudentDetailView(path: $path, student: Student(name: "Swastik", email: "swastik@gmail.com", enrolledCourses: [Course(code: "CS101", title: "Intro to CS")]))
}

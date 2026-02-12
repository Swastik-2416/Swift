//
//  ContentView.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import SwiftUI

struct ContentView: View {
    let studentModel = StudentModel()
    @State private var path = NavigationPath()
    var body: some View {
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show student ID") {
//                    path.append(101)
//                }
//                .buttonStyle(.borderedProminent)
//                Button("Show student name") {
//                    path.append("Lakshay")
//                }
//                .buttonStyle(.borderedProminent)
//                Button("Show 101 then 103") {
//                    path.append(101)
//                    path.append(103)
//                }
//                .buttonStyle(.borderedProminent)
//            }
//            .navigationTitle("Student Portal")
//            .navigationDestination(for: Int.self) { id in
//                StudentID(path: $path, studentID: id)
//                
//            }
//            .navigationDestination(for: String.self) { name in
//                StudentName(studentName: name)
//            }
//        }
        NavigationStack(path: $path) {
            List{
                Section() {
                    ForEach(studentModel.students) {
                        student in
                        Button(action: {
                            path.append(student)
                        }) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .foregroundStyle(Color.blue)
                                    .font(.system(size: 60))
                                VStack(alignment: .leading){
                                    Text(student.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text(student.email)
                                        .font(.headline)
                                }
                            }
                            
                        }
                    }
                }
                
            }
            .navigationTitle("Student Portal")
            .navigationDestination(for: Student.self) { student in
                StudentDetailView(path: $path, student: student)
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

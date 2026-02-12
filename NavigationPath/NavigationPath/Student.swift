//
//  Student.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import Foundation
struct Student : Hashable, Identifiable{
    let id =  UUID()
    let name: String
    let email: String
    let enrolledCourses: [Course]

}
struct Course: Hashable, Identifiable{
        let id =  UUID()
        let code: String
        let title: String
}
class StudentModel {
    let swiftUI = Course(code: "CS401", title:"SwiftUI")
    let dataStructures = Course(code: "CS301", title:"Data Structures")
    let toc = Course(code: "CS303", title:"Theory of Computation")
    
    var students: [Student] = []
    init() {
        students = [
            Student(name: "Swastik Mandal", email: "swastikmandal@gmail.com", enrolledCourses: [swiftUI, dataStructures]),
            Student(name: "Ankit Sharma", email: "ankitsharma@gmail.com", enrolledCourses: [toc]),
            Student(name: "Aman Sharma", email: "amansharma@gmail.com", enrolledCourses: [swiftUI, toc])
        ]
    }
}

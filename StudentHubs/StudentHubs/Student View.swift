//
//  Student View.swift
//  StudentHubs
//
//  Created by GU on 10/12/25.
//

import SwiftUI

struct Student_View: View {
    var currentStudent: Student = Student()
    
    var body: some View {
        VStack {
            HStack {
                Text(currentStudent.firstName)
                Text(currentStudent.lastName)
            }
            Text("\(currentStudent.age) yrs")
        }
    }
}

#Preview {
    Student_View()
}

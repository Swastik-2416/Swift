//
//  CourseDetail.swift
//  NavigationPath
//
//  Created by Swastik Mandal on 23/01/26.
//

import SwiftUI

struct CourseDetail: View {
    @Binding var path: NavigationPath
    let course: Course
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "book.fill")
                .font(.system(size: 80))
                .foregroundColor(Color(.green))
            Text(course.title)
                .font(.largeTitle)
                .bold()
            Text(course.code)
                .font(.title2)
            Divider()
                .padding()
            VStack(spacing: 15) {
                Button("Go back oneScreen") {
                    path.removeLast()
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                Button("Back to Home") {
                    path.removeLast(path.count)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
        }
        .padding()
        .navigationTitle("Course Detail")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    CourseDetail(path: $path, course: Course(code: "CS401", title:"SwiftUI"))
}

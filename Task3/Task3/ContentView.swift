//
//  ContentView.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    var image: String
    var name: String
}

struct Profile: View {
    var student: Student
    
    var body: some View {
        HStack(spacing: 20){
            Image(student.image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            Text(student.name)
                .font(.title)
                .bold()
            Spacer()
        }
        .background(.teal.opacity(0.1))
    }
}
struct ContentView: View {
    var student = [Student(image: "Image", name: "Prem"),
    Student(image: "Image", name: "Swastik"),
    Student(image: "Image", name: "Anushka"),
    Student(image: "Image", name: "Laadsahiba")]
    var body: some View {
        VStack {
            ForEach(student){ students in Profile(student: students)
                
            }
        }
        .padding()
//        for i in 1...10{
//            Profile()
//        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Lab Exercise
//
//  Created by GU on 07/01/26.
//

import SwiftUI

struct Profile {
    var name: String
    var age: Int
    var role: String
    var isMarried: Bool
}

struct ContentView: View {
    @State private var profile = Profile(name: "", age: 0, role: "", isMarried: false)

    var body: some View {
        VStack {
            Text("Profile Summary")
                .font(.title2)
                .bold()

            Text("Name: \(profile.name)")
            Text("Age: \(profile.age)")
            Text("Role: \(profile.role)")
            Text(profile.isMarried ? "Married" : "Single")
            
            EditProfile(name: $profile.name, age: $profile.age, role: $profile.role, isMarried: $profile.isMarried)
            
        }
        .padding()
    }
}

struct EditProfile: View {
    @Binding var name: String
    @Binding var age: Int
    @Binding var role: String
    @Binding var isMarried: Bool

    let roles = ["Student", "Developer", "Designer", "Manager"]

    var body: some View {
        VStack {
            Text("Edit Profile")
                .font(.headline)

            TextField("Name", text: $name)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(20)

            Stepper("Age: \(age)", value: $age, in: 1...100)

            Picker("Role", selection: $role) {
                Text("Student").tag("Student")
                Text("Developer").tag("Developer")
                Text("Designer").tag("Designer")
                Text("Manager").tag("Manager")
                
                }
            .pickerStyle(.segmented)

            Toggle("Married", isOn: $isMarried)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}

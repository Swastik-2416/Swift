//
//  SimpleForm.swift
//  statebindings
//
//  Created by GU on 07/01/26.
//

import SwiftUI

struct SimpleForm: View {
    @State private var username = ""
    @State private var password = ""
    @State private var speed: Double = 5
    @State private var quantity: Int = 0
    @State private var gender = "Male"
    @State private var number = 0
    var body: some View {
        VStack{
            TextField("Enter Username" , text: $username)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding(10)
            SecureField("Enter Password" , text: $password)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding(10)
            Slider(value: $speed, in: 0...10)
                .padding(20)
            Text("Speed: \(Int(speed))")
            
            Stepper("Quantity" , value: $quantity, in: 0...10)
                .padding(20)
            Text("Quantity: \(quantity)")
                .padding(10)
            
            Picker("Select Gender", selection: $gender)
            {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
//            .pickerStyle(.menu)
            .pickerStyle(.segmented)
//            .pickerStyle(.palette)
//            .pickerStyle(.navigationLink)
            
            Picker("Number", selection: $number) {
                ForEach(1..<100) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.wheel)
            .padding(10)
            
            
            
        }
        
    }
}

#Preview {
    SimpleForm()
}

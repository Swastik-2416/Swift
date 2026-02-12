//
//  Second Screen.swift
//  ProfileApp
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct Second_Screen: View {
    var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 350, height:400)
                    .foregroundColor(.red)
                    .cornerRadius(20)
                VStack {
                    Rectangle()
                        .frame(width: 250, height:250)
                        .foregroundColor(.green)
                        .cornerRadius(20)
                }
            }
            .padding()
            Section {
                List {
                    NavigationLink(destination: Third_Screen()) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("People")
                        }
                    }
                }
            } 
    }
}

#Preview {
    Second_Screen()
}

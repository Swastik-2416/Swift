//
//  Task 5.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct Task_5: View {
    @State var todo = ["Hello how are you?, Hello how are you?, Hello how are you?"]
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ScrollView() {
                VStack {
                    ForEach(todo, id: \.self) { name in
                        Text(name)
                            .padding()
                            .background(Color(.systemGray6))
                            .font(.largeTitle)
                    }
                    Button{
                        todo.append("Hello how are you?, Hello how are you?, Hello how are you?")
                    } label : {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                            .bold()
                    }
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                }
            }
        }
    }
}

#Preview {
    Task_5()
}

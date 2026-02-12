//
//  Red_Light_View.swift
//  Traffic Light
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct Red_Light_View: View {
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            NavigationLink( destination: Yellow_Light_View()) {
                HStack{
                    Image(systemName: "circle.fill")
                    Text("Go to yellow")
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    NavigationStack {
        Red_Light_View()
    }
}

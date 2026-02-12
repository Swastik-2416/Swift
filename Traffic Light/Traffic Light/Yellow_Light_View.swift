//
//  Yellow_Light_View.swift
//  Traffic Light
//
//  Created by Swastik Mandal on 19/01/26.
//

import SwiftUI

struct Yellow_Light_View: View {
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            NavigationLink("Go to green", destination: Green_Light_View())
        }
        .navigationTitle("Yellow Light")
    }
}

#Preview {
    NavigationStack {
        Yellow_Light_View()
    }
}

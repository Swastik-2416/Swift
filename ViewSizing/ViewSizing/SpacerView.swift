//
//  SpacerView.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        VStack{
            Text("Top")
                .padding()
                .background(.green)
            Spacer()
                .frame(maxWidth:.infinity)
                .background(.blue)
            Text("Bottom")
                .padding()
                .background(.green)
        }
        .frame(height: 300)
        .border(.red)
        .padding()
    }
}

#Preview {
    SpacerView()
}

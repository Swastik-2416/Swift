//
//  StarReview.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI


struct StarReview: View {
    @State var rating = 1
    var body: some View {
        HStack {
            ForEach(1..<6) { i in
                Button {
                    rating = i
                } label : {
                    Image(systemName: "star")
                        .font(.largeTitle)
                        .symbolVariant(rating >= i ? .fill : .none)
                }
            }
            
        }
        
    }
}

#Preview {
    StarReview()
}

//
//  MultiScroll.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct MultiScroll: View {
    var body: some View {
        Text("Restraunt")
            .font(.largeTitle)
            .bold()
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(1..<100) { i in
                    Text("Restraunts in\(i)")
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1..<10) { j in
                                Text("Dish\(j)")
                                    .frame(width:100, height:100)
                                    .background(.blue.opacity(0.1))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MultiScroll()
}

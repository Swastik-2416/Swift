//
//  Scroll.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(1..<100) { i in
                    Text("Item no. :\(i)")
                        .bold()
                        .padding()
                        .background(Color.blue)
                }
            }
        }
    }
}

#Preview {
    Scroll()
}

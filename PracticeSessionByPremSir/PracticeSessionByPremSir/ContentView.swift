//
//  ContentView.swift
//  PracticeSessionByPremSir
//
//  Created by Swastik Mandal on 05/02/26.
//

import SwiftUI

struct ContentView: View {
    let rows = [GridItem(.fixed(80),spacing: 20), GridItem(.fixed(80))]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows:rows){
                ForEach(1...50,id: \.self) { i in
                    ZStack {
                        Rectangle()
                            .frame(width:50)
                        Text("cell \(i)" )
                            .foregroundStyle(.white)
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

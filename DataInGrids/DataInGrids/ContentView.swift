//
//  ContentView.swift
//  DataInGrids
//
//  Created by Swastik Mandal on 04/02/26.
//

import SwiftUI

struct ContentView: View {
    let rows = [GridItem(.fixed(80), spacing: 20)]
    var body: some View {
        ScrollView(.horizontal){
            
            LazyHGrid(rows:rows, spacing: 50) {
                ForEach(1...20, id: \.self) { cell in
                    Color.red
                        .frame(width:100)
                        .overlay{
                            Text("Item\(cell)").foregroundStyle(.white)
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

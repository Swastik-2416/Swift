//
//  VGrid.swift
//  DataInGrids
//
//  Created by Swastik Mandal on 04/02/26.
//

import SwiftUI

struct VGrid: View {
    let cols = [GridItem(.fixed(80), spacing: 20)]
    var body: some View {
        ScrollView(.vertical){
            
            LazyVGrid(columns:cols) {
                ForEach(1...20, id: \.self) { cell in
                    Color.red
                        .frame(height:100)
                        .overlay{
                            Text("Item\(cell)").foregroundStyle(.white)
                        }
                }
                
            }
        }
    }
}

#Preview {
    VGrid()
}

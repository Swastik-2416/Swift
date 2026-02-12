//
//  LazyVGrid.swift
//  PracticeSessionByPremSir
//
//  Created by Swastik Mandal on 05/02/26.
//

import SwiftUI

struct LVGrid: View {
    let columns = [GridItem(.adaptive(minimum: 75))]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(1...50,id: \.self) { i in
                    ZStack {
                        Rectangle()
                            .frame(height:100)
                        Text("cell \(i)" )
                            .foregroundStyle(.white)
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    LVGrid()
}

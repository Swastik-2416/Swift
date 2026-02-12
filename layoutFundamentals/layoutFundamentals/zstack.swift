//
//  zstack.swift
//  layoutFundamentals
//
//  Created by GU on 12/12/25.
//

import SwiftUI

struct zstack: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.blue)
                .frame(width: 200, height: 200)
                .zIndex(1)
            Image(systemName: "star")
                .font(.system(size: 100))
                .foregroundColor(.white)
                .zIndex(3)
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.yellow)
                .frame(width: 150, height: 150)
                .zIndex(2)
            Text("HEllo world akdhnjdfssdijfsd")
                .background(Color.blue)
                .zIndex(4)
            
        }
    }
}

#Preview {
    zstack()
}

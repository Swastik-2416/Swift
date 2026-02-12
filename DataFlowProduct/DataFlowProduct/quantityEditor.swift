//
//  quantityEditor.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct quantityEditor: View {
    @Bindable var item: CartItem
    var body: some View {
        HStack{
            Text(item.name)
            Stepper(value: $item.quantity, in: 1...10){
                Text("\(item.quantity)")
            }
            .padding(.horizontal,12)
        }
    }
}

#Preview {
    quantityEditor(item: CartItem(name: "iPhone", quantity: 1))
}

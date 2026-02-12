//
//  CartViewList.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct CartViewList: View {
    @Environment(Cart.self) private var cart
    var body: some View {
        NavigationStack{
            List{
                ForEach(cart.items) { item in
                    quantityEditor(item: item)
                }
            }.navigationTitle(Text("Cart"))
        }
    }
}

#Preview {
    CartViewList()
        .environment(Cart())
}

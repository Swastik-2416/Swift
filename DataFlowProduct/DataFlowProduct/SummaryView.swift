//
//  SummaryView.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct SummaryView: View {
    @Environment(Cart.self) private var cart
    var totalItems:Int{
        cart.items.reduce(0){$0 + $1.quantity}
    }
    var body: some View {
        VStack{
            Text("Cart Summary")
                .font(.title).bold()
            Text("Total Items: \(totalItems)")
            Button("Clear Cart"){
                cart.items.removeAll()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    SummaryView()
        .environment(Cart())
}

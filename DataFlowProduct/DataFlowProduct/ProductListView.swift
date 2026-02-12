//
//  ProductListView.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct ProductListView: View {
    @Environment(Cart.self) private var cart
    let products = ["iPhone", "iPad", "MacBook","iWatch","AirPods"]
    var body: some View {
        NavigationStack{
            List{
                ForEach(products,id: \.self){ product in
                    HStack{
                        Text(product)
                        Spacer()
                        Button("Add"){
                            cart.addItem(name: product)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.horizontal,12)
                }
            }
            .navigationTitle(Text("Products"))
        }
    }
        
}

#Preview {
    ProductListView()
        .environment(Cart())
}

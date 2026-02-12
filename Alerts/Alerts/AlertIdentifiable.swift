//
//  AlertIdentifiable.swift
//  Alerts
//
//  Created by Swastik Mandal on 30/01/26.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct AlertIdentifiable: View {
    @State private var selectedProduct: Product?
    @State private var showAlert = false
    let products = [
        Product(name: "MacPro", price: 200000),
        Product(name: "iPhone", price: 94000),
        Product(name: "iPad", price: 53000),
        Product(name: "iWatch", price: 27000)
    ]
    var body: some View {
        NavigationStack{
            List(products) { product in
                Button {
                   selectedProduct = product
                    showAlert = true
                } label : {
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("\(Int(product.price))")
                    }
                }
            }
            .navigationTitle("Product List")
            .alert("Product Selected", isPresented: $showAlert, presenting: selectedProduct) {
                product in
                Button("OK", role: .cancel){}
            } message: {product in 
                Text("You have selected \(product.name) and it's price is \(product.price)")
            }
        }
    }
}

#Preview {
    AlertIdentifiable()
}

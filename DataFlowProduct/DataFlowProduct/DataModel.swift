//
//  DataModel.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import Foundation
@Observable
class CartItem:Identifiable{
    let id = UUID()
    let name: String
    var quantity: Int
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}

@Observable
class Cart{
    var items:[CartItem] = []
    func addItem(name:String){
        if let item = items.first(where:{$0.name == name}){
            item.quantity += 1
        }else{
            items.append(CartItem(name: name, quantity: 1))
        }
    }
}

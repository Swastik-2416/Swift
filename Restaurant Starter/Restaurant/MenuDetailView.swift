//
//  MenuDetailView.swift
//  Restaurant
//
//  Created by Shruti Sachdeva on 18/01/26.
//

import SwiftUI

struct MenuDetailView: View {
    let menu: Menu
    
    var body: some View {
        NavigationStack {
            Text(menu.name)
            List(menu.dishes) { dish in
                NavigationLink{
                    DishDetailView(dish: dish)
                } label : {
                    DishRowView(dish: dish)
                }
                
            }
        }
    }
}

#Preview {
    MenuDetailView(menu: Restaurant.sampleData[0].menus[0])
}

//
//  RestaurantDetailView.swift
//  Restaurant
//
//  Created by Shruti Sachdeva on 18/01/26.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        NavigationStack {
            Text(restaurant.name)
            List(restaurant.menus) { menu in
                NavigationLink{
                    MenuDetailView(menu: menu)
                } label: {
                    MenuRowView(menu: menu)
                }
            }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant.sampleData[0])
}

//
//  RestaurantListView.swift
//  Restaurant
//
//  Created by Shruti Sachdeva on 18/01/26.
//

import SwiftUI

import SwiftUI

struct RestaurantListView: View {
    let restaurants = Restaurant.sampleData
    
    var body: some View {
        NavigationStack{
            List(restaurants){ restaurant in
                NavigationLink {
                    RestaurantDetailView(restaurant: restaurant)
                } label: {
                    RestaurantRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("Restaurants")
        }
    }
}

#Preview {
    RestaurantListView()
}

//
//  ContentView.swift
//  DataFlowProduct
//
//  Created by Anushka Sharma on 12/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("ProductList",systemImage: "cart.fill"){
                ProductListView()
            }
            Tab("Cart",systemImage: "bag.fill"){
                CartViewList()
            }
            Tab("Summary",systemImage: "chart.bar.fill"){
                SummaryView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Cart())
}

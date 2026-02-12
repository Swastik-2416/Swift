//
//  ContentView.swift
//  CountriesTask
//
//  Created by GU on 04/02/26.
//

import SwiftUI

struct ContentView: View {
    let countries = CountryData.countries
    let column = [GridItem(.adaptive(minimum: 180))]
    var body: some View{
        ScrollView{
            LazyVGrid(columns:column, spacing: 20) {
                ForEach(countries){ country in
                    CountryCardView(country: country)
                }
            }
            
        }
    
    }
}

#Preview {
    ContentView()
}

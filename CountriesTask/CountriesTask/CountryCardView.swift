//
//  ountryCardView.swift
//  CountriesTask
//
//  Created by GU on 04/02/26.
//

import SwiftUI

struct CountryCardView: View {
    var country:Country
    var body: some View {
        VStack{
            Image(country.flag)
                .resizable()
                .scaledToFill()
                .frame(width:180, height:100)
                .clipped()
            Text(country.name)
                .font(.title)
                .lineLimit(1)
            Text(country.capital)
                .padding(.bottom)
                
                
            
        }
        .foregroundStyle(.white)
        .background(.green.opacity(0.9))
        .cornerRadius(20)
        
    }
}

#Preview {
    CountryCardView(country: Country(name: "Afganistan", capital: "Kabul", flag: "af"))
}

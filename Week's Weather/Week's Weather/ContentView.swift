//
//  ContentView.swift
//  Week's Weather
//
//  Created by GU on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Weekly Weather")
            .font(Font.largeTitle)
            
        HStack{
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "cloud.rain.fill", low: 20, high: 35)
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "cloud", low: 20, high: 35)
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "sun.max", low: 20, high: 35)
        }
        HStack{
            Weather_Today(day: "Mon", weather: "windy", iconName: "wind", low: 20, high: 35)
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "sun.haze", low: 20, high: 35)
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "cloud.rain.fill", low: 20, high: 35)
        }
        HStack{
            Weather_Today(day: "Mon", weather: "Rainy", iconName: "cloud.fill", low: 20, high: 35)
        }
        
    }
}

#Preview {
    ContentView()
}

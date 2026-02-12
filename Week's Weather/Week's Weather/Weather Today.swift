//
//  Weather Today.swift
//  Week's Weather
//
//  Created by GU on 10/12/25.
//

import SwiftUI

struct Weather_Today: View {
    var day: String = "Mon"
    var weather: String = "rainy"
    var iconName: String = "cloud"
    var low: Int = 0
    var high: Int = 0

    var body: some View {
        
        VStack{
            Text(day)
            Image(systemName: iconName)
            Text(weather)
            Text("Low \(low)")
            Text("High \(high)")
        }
        .padding()
        .border(.primary)



    }
}

#Preview {
    Weather_Today()
}

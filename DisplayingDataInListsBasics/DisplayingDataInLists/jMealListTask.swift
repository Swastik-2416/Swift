//
//  jMealListTask.swift
//  DisplayingDataInLists
//
//  Created by Probeer on 08/01/26.
//

import SwiftUI

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let foodItems: [String]
}

struct jMealListTask: View {
    let meals: [Meal] = [Meal(name: "Breakfast",
                              foodItems: ["Toast",
                                          "Eggs",
                                          "Fruits"]),
                         Meal(name: "Lunch",
                              foodItems: ["Rice",
                                          "Dal",
                                          "Vegetables"]),
                         Meal(name: "Dinner",
                              foodItems: ["Roti",
                                          "Sabzi",
                                          "Soup"])]
    
    var body: some View {
        List {
            ForEach(meals) { meal in
                Section{
                    ForEach(meal.foodItems, id: \.self) { item in
                        Text(item)
                    }
                } header: {
                    Text(meal.name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.black)
                }
            }
        }
    }
    
}

#Preview {
    jMealListTask()
}

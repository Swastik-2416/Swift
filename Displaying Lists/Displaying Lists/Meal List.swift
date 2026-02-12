//
//  Meal List.swift
//  Displaying Lists
//
//  Created by GU on 08/01/26.
//

import SwiftUI

struct Meal: Identifiable {
    let id = UUID()
    var name: String
}
struct MealCollection: Identifiable {
    let id = UUID()
    var title: String
    var meals: [Meal]
}
struct Meal_List: View {
    var mealCollection = [MealCollection(title: "Breakfast", meals: [Meal(name: "Toast"), Meal(name: "Eggs"), Meal(name:"Fruits")]),
                          MealCollection(title: "Lunch", meals: [Meal(name: "Salad"), Meal(name: "Sandwich"), Meal(name:"Pasta")]),
                          MealCollection(title: "Dinner", meals: [Meal(name: "Steak"), Meal(name: "Chicken"), Meal(name:"Rice")])]
    var body: some View {
        List {
            ForEach(mealCollection) { mealCollection in
                Section {
                    ForEach(mealCollection.meals) { meal in
                        Text(meal.name)
                    }
                }header : {
                    Text(mealCollection.title)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.black)
                    
                }
            }
        }
    }
}

#Preview {
    Meal_List()
}



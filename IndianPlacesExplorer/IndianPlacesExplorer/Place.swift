//
//  Place.swift
//  IndianPlacesExplorer
//
//  Created by kiran singh on 30/01/26.
//

import Foundation

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

let places: [Place] = [
    Place(
        name: "Charminar",
        imageName: "Charminar",
        description: "A historic monument in Hyderabad."
    ),
    Place(
        name: "Gateway of India",
        imageName: "GatewayofIndia",
        description: "Iconic waterfront monument in Mumbai."
    ),
    Place(
        name: "Howrah Bridge",
        imageName: "HowrahBridge",
        description: "Famous cantilever bridge in Kolkata."
    ),
    Place(
        name: "India Gate",
        imageName: "IndiaGate",
        description: "War memorial located in New Delhi."
    ),
    Place(
        name: "Taj Mahal",
        imageName: "Tajmahal",
        description: "World-famous marble mausoleum in Agra."
    )
]

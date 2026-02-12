import UIKit

class Vehicle {
    let currentSpeed: Double
    
    var description: String {
        "the vehicle is moving at \(currentSpeed) km/hr"
    }
    init(currentSpeed: Double) {
        self.currentSpeed = currentSpeed
    }
    func makeNoise() {
        print("Vehicle is making noise")
    }
}

let aVehicle = Vehicle(currentSpeed: 34.00)
print(aVehicle.currentSpeed)
aVehicle.makeNoise()

class Bicycle: Vehicle {
    override var description: String {
        super.description + "and it is a bicycle"
    }
    override func makeNoise() {
        print("bicycle makes noise")
    }
}
let aBicycle = Bicycle(currentSpeed: 14)
aBicycle.makeNoise()
aVehicle.makeNoise()

class MeraDost {
    var name: String
    var udhari: Int
    
    init(name: String, udhari: Int) {
        self.name = name
        self.udhari = udhari
    }
}
var ajay = MeraDost(name: "Ajay", udhari: 500)
var ajayMyCopy = ajay
ajayMyCopy.udhari += 500
print (ajayMyCopy.udhari)
print(ajay.udhari)


//Upcast and Downcast
let anotherBicycle: Bicycle = Bicycle(currentSpeed: 56.0)
let anotherVehicle: Vehicle = anotherBicycle


let Vehicle: Vehicle = Vehicle(currentSpeed: 78)
let

class MessageManager {
    private var messages: [Message] = []
    
}

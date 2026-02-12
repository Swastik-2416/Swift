import UIKit

struct Person {
    var name: String
    
    func sayHello(){
        print("hello\(name)")
    }
}
let p1=Person(name: "Prisha")
let p2=Person(name: "Swastik")
print(p1.name)
p2.sayHello()

struct Shirt {
    var size:Int
    var color: String
    func fit() {
        print("Size of shirt is \(size) and color is \(color)")
    }
}
let a1=Shirt(size:40, color:"Blue")
a1.fit()
let s1=String.init()
let s2=Bool()


struct Car {
    var make: String
    var color: String
    var year: Int
    
    func startEngine() {
        print ("Engine of \(make) has started")
    }
}
let firstCar=Car(make: "Volkswagen",  color: "Black", year: 2024)
firstCar.startEngine()


struct Cars{
    var odometer: Int=32000
}
let o1 = Cars()
let o2=Cars(odometer: 500)

struct Bank {
    var accNo: Int
    var balance: Int=0
}
let b1=Bank(accNo: 33300)


struct Temperature {
    var celcius: Double
    
    init(celcius: Double) {
        self.celcius=celcius
    }
    init (farenheit: Double) {
        celcius=(farenheit - 32)/1.8
    }
    init(kelvin: Double) {
        celcius = kelvin - 273.15
    }
    init() {
        celcius=0
    }
    
//let temp=Temperature(celcius:32.9)
//var fahranheight: Double=9.8
//var c1=(fahranheight-32)/1.8
//let newTemp=Temperature(celcius: c1)

}
let currentTemperature=Temperature(celcius: 18.5)
let boiling=Temperature(farenheit: 212.5)
let absoluteZero=Temperature(kelvin: 0.0)
let freezing=Temperature()
print(currentTemperature.celcius)
print(boiling.celcius)
print(absoluteZero.celcius)
print(freezing.celcius)


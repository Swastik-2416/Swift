import UIKit

struct Odometer {
    var count: Int=0
    mutating func increament() {
        count += 1
        
    }
    mutating func increament(amount:Int){
        count += amount
    }
    mutating func reset() {
        count=0
    }
}
var odometer = Odometer()
odometer.increament()
print (odometer.count)
odometer.increament(amount: 15)
print(odometer.count)


struct Temperature {
    var celcius : Double
    var fahrenheit : Double
    var kelvin : Double
    init(celcius: Double){
        self.celcius=celcius
        fahrenheit=celcius * 1.8 + 32
        kelvin=celcius + 273.15
        
    }
    init (fahrenheit: Double) {
        self.fahrenheit = fahrenheit
        celcius = (fahrenheit - 32) / 1.8
        kelvin=celcius + 273.15
    }
    init (kelvin:Double) {
        self.kelvin=kelvin
        celcius=kelvin - 273.15
        fahrenheit=celcius * 1.8 + 32
    }
}
let currentTemperature = Temperature(celcius: 50)
print()

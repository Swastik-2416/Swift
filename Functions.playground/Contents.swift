import UIKit
func sayHello() {
    print("Hello")
}
sayHello()
func sayHello(personName: String) {
    print("Hello,\(personName)")
}
sayHello(personName: "Swastik")

func verifyName(personName: String) -> String {
    let nameOnRecords="Karan"
    if (personName==nameOnRecords) {
        return "Name verified"
    }else {
        return "Name not verified"
    }
}
let aPerson=verifyName(personName: "Swastik")
print(aPerson)

func addStudent(_ sName: String="NA", schoolName: String="SCSE", rNumber: Int=0) {
    print("Student with name \(sName), school \(schoolName) and roll number \(rNumber) is registered")
}
addStudent("Swastik", schoolName:"SCSE", rNumber: 123)
addStudent("Rohan", schoolName:"SCAT", rNumber: 453)
addStudent("kavita", rNumber: 098)


func add(firstNumber: Int, secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}
let sum=add(firstNumber: 10, secondNumber: 20)
print(sum)

func sayHello(to person: String, and anotherPerson: String) {
    print("\(person) and \(anotherPerson)")
}
sayHello(to: "Swastik" ,and: "Prem")


func calculateSaving(priceOfCar: Int, oldRateGst:Int, newRateGst:Int) -> (oldCostOfCar:Int,newCostOfCar:Int,savingOnCar:Int) {
    let oldCostOfCar = priceOfCar + priceOfCar * oldRateGst / 100
    let newCostOfCar = priceOfCar + priceOfCar * newRateGst / 100
    let savingOnCar = oldCostOfCar - newCostOfCar
    return (oldCostOfCar,newCostOfCar,savingOnCar)
}
let value = calculateSaving(priceOfCar: 750000, oldRateGst: 28, newRateGst: 18)
print ("""
    \(value.newCostOfCar)
    \(value.oldCostOfCar)
    \(value.savingOnCar)
    """)

import UIKit
//
////function
//func sayHello() -> String {
//    return "This is a function"
//}
//sayHello()
//
////Closure
//let saysHello = {
//    print("This is a closure")
//}
//saysHello()
//
//func add(x: Int, y:Int) -> Int {
//    return x + y
//}
//print(add(x: 1, y: 2))
//
//
//let addClosure = { (x:Int, y:Int) -> Int in
//    x + y
//}
//print(addClosure(1  , 2))
//
//
//let printClosure = { () -> Void in
//    print("This is a closure")
//}
//
//let anotherPrintClosure = {(String)-> Void in
//    print(String)
//}
//anotherPrintClosure("This is another closure type")
//
//let randomInt = { () -> Int in
//    return Int.random(in: 1...100)
//}
//print(randomInt())
//
//let randomInt2 = { (x:Int , y: Int) -> Int in
//    return Int.random(in: x...y)
//}
//print(randomInt2(1, 100))


let sayHello = {
    print("This is a clousre")
}

func getClosure(aClosure: () -> ()) {
    aClosure()
}
getClosure(aClosure: sayHello)


//let sum = {(x:Int, y:Int) -> Int in
//    print(sum)
//}
//func getSum(aSum: () -> ()) {
//    return x + y
//}

//func mathOperations(x:Int, y:Int, operation:(Int, Int) -> Int) -> Int {
//    return operation(x, y)
//}
//
//
//let add: (Int, Int) -> Int = {$0 + $1}  //shorthand notation
//print(mathOperations(x: 29, y: 30, operation: add))
//
//let subtract = { (x:Int, y:Int) in x - y}
//print(mathOperations(x: 29, y: 30, operation: subtract))
//
//let multiply = { (x:Int, y:Int) in x * y}
//print(mathOperations(x: 29, y: 30, operation: multiply))
//
//let divide = { (x:Int, y:Int) in
//    if y == 0 {
//        return 0
//    } else {
//        return x / y
//    }
//}
//print(mathOperations(x:12, y: 4, operation: divide))


func performFunction(on numbers:[Int], using operation:([Int])->Int)->Int {
    return operation(numbers)
}
let arr = [1,2,3,4]
let add = { (numbers:[Int]) -> Int in
    var num = 0
    for number in numbers {
        num += number
    }
    return num
    
}
print(performFunction(on: arr, using: add))


//Trailing closure
let multiply = (performFunction(on: arr) {
    (numbers:[Int]) -> Int in
        var num:Int = 1
        for number in arr {
            num *= number
        }
        return num
})



struct Track {
    var trackNumber:Int
    var starRating: Int
}
let tracks = [Track(trackNumber: 101, starRating: 5),
              Track(trackNumber: 100, starRating: 2),
              Track(trackNumber: 201, starRating: 3),
              Track(trackNumber: 151, starRating: 4)]

var sortedTracks = tracks.sorted() {$0.trackNumber < $1.trackNumber}
for track in sortedTracks {
    print(track)
}

let emails = ["Aefh", "QIeIEh", "SDhwd"]

var correctEmail = emails.map{ $0.lowercased()}
//var lowerEmail = [String]()
//for email in emails {
//    lowerEmail.append(emails.lowercased())
//}
print(correctEmail)

let scores = [10,50,94,52,75]
var scoreAbove = scores.filter{$0>90}
print(scoreAbove)
var highestScore = scores.reduce(0, {max($0,$1)})
print(highestScore)


func increamenter() {
    var count = 0
    let increamentByOne = {count += 1}
    increamentByOne()
    increamentByOne()
    
    print(count)
    
    count = 12
    increamentByOne()
    print(count)
    
}
increamenter()

func makeIncreamenter(by amount: Int)->()->(Int) {
    var count = 0
    let increamenter = {
        count += amount
        return count
    }
    
    return increamenter
    
}
let increamentByTen = makeIncreamenter(by: 10)
print(increamentByTen())
print(increamentByTen())

let increamentBySeven = makeIncreamenter(by : 7)
print(increamentBySeven())
print(increamentBySeven())

let anotherIncreamentByTen = increamentByTen
print(increamentByTen())



//let printOrderStatus = { orderStatus in
//    print(orderStatus)
//}

//SeRVER
func confirmOrder(itemName: String, serverCallback: (String)-> ()) {
    print("Server: processing order for \(itemName)")
    let response = "Tour oreder placed successully "
    serverCallback(response)
    
}



func placeOrder(itemName:String, completion:(String)->Void) {
    print("CLIENT: placing order for \(itemName)")
    confirmOrder(itemName:itemName) {
        serverResponse in
        completion(serverResponse)
    }
}
//placeOrder(itemName: "Samosa", completion: printOrderStatus)
placeOrder(itemName: "Samosa") { result in
    print(result)
}

//
//struct Person {
//    var name: String
//    var age: Int
//    init(initializer: () -> (String, Int)) {
//        (name,age) = initializer()
//    }
//}
//let aPerson = Person{
//    ("Probeer", 18)
//}
//print(aPerson)
//
//
////String Builder
//@resultBuilder
//struct simpleStringBuilder {
//    static func buildBlock(_ components: String...) -> String {
//        components.joined(separator: " ")
//    }
//}
//@simpleStringBuilder
//func similarStrings () -> String{
//    "Hi"
//    "I"
//    "Am"
//    "Swastik"
//}
//print(similarStrings())



@resultBuilder
struct simpleStringBuilder {
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: " ")
    }
}
struct Person {
    var fullName: String
    
    init(@simpleStringBuilder Initializer: ()-> (String)) {
        fullName = Initializer()
    }
    
}
let aPerson = Person{
    "Swastik"
    "Mandal"
}
print(aPerson)


protocol Displayable {
    func display()
}
struct Minor:Displayable {
    var name: String
    var age: Int
    
    func display() {
        print("This person is a minor, \(name), \(age)")
    }
}
struct Adult: Displayable {
    func display() {
        print("This person is a Adult, \(name), \(age), \(voterID)")
    }
    
    var name: String
    var age: Int
    var voterID: String
    
    
}
struct People: Displayable {
    let people: [Displayable]
    
    init(@PeopleBuilder initializer: () -> [Displayable]) {
        people = initializer()
    }
    func display() {
        for person in people {
            person.display()
        }
    }
}

@resultBuilder
struct PeopleBuilder{
    static func buildExpression(_ expression: Displayable) ->  [Displayable] {
        [expression]
    }
    static func buildBlock(_ components: [Displayable]...) -> [Displayable] {
        components.flatMap{$0}
    }
}
let people = People {
    Minor(name: "A", age: 3)
    Adult(name: "B", age: 25, voterID: "asd")
    Minor(name: "C", age: 12)
    Adult(name: "D", age: 25, voterID: "qwr")
    
}
people.display()


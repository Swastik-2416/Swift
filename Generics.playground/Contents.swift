import UIKit

var ints: Array<Int>
var strings: Array<String>

//Dictionary
let wordsByLength = [
    1: ["a"],
    2: ["ab", "ba"],
    3: ["abc", "cba", "bca"]
]
var wordByLength = [Int: [String]]()
var wordByLength2 = Dictionary<Int, [String]>()
struct Dictionary<Key, Value> where Key: Hashable {
    
}


func increament(value: inout Int) {
    value += 1
}
var number = 5
increament(value: &number )

//func swaptwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//var someInt = 3
//var anotherInt = 4
//swaptwoInts(&someInt, &anotherInt)
//print("someInt \(someInt), anotherInt \(anotherInt)")


//func swaptwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//var someString = "Hello"
//var anotherString = "World"
//swaptwoStrings(&someString, &anotherString)
//print("someInt \(someString), anotherInt \(anotherString)")


func swaptwoValue<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 4
swaptwoValue(&someInt, &anotherInt)
print("someInt \(someInt), anotherInt \(anotherInt)")
var someString = "Hello"
var anotherString = "World"
swaptwoValue(&someString, &anotherString)
print("someInt \(someString), anotherInt \(anotherString)")

var someDouble = 4.7
var anotherDouble = 3.14
swaptwoValue(&someDouble, &anotherDouble)
print("someInt \(someDouble), anotherInt \(anotherDouble)")


func max<T>(_ a: T, _ b: T) -> T where T: Comparable {
    if a>=b {
        return a
    } else {
        return b
    }
}


//Types
struct Stack<Element>{
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        
        return items.removeLast()
    }
    func display(){
        for item in items {
            print(item)
        }
    }
}
//Extensions
extension Stack{
    var topItem: Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


var myIntStack = Stack<Int>()
myIntStack.push(1)
myIntStack.push(2)
myIntStack.push(3)
myIntStack.display()
myIntStack.pop()
myIntStack.display()

if let topItem = myStringStack.topItem{
    print("The top item is \(topItem)")
}


var myStringStack = Stack<String>()
var dictionary = Dictionary<Int,[String]>()
myStringStack.push("Hello")
myStringStack.push("World")
myStringStack.display()
myStringStack.pop()
myStringStack.display()


//Non generic function
//func findIndex<T: Equatable>(ofString valueToFnd : T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated( ) {
//        if value == valueToFnd {
//            return index
//        }
//    }
//    return nil
//}
//let string = ["Hello", "World", "Galgotias"]
//if let foundIndex = findIndex(ofString: "World", in: string) {
//    print("Found index: \(foundIndex)")
//}
//
//protocol TestData1 {
//    func sumOfData(a: Int, b:Int) -> Int
//}
//protocol TestData2 {
//    func sumOfData(a: Int, b:Int) -> Int
//}
//struct MyData1 : TestData1 {
//    func sumOfData(a: Int, b:Int) -> Int{
//        return a + b
//    }
//}
//struct MyData2 : TestData2 {
//    func sumOfData(a: Int, b:Int) -> Int{
//        return a + b
//    }
//}
//
//let obj2 = MyData2()
//let result2 = obj2.sumOfData(a: 10, b: 20)
//print("Result2 : \(result2)")



protocol TestData {
    associatedtype DataType
    func sumOfData(a: DataType, b:DataType) -> DataType
}
struct MyData1 : TestData {
    typealias DataType = Int
    func sumOfData(a: Int, b:Int) -> Int{
        return a + b
    }
}

struct MyData2 : TestData {
    typealias DataType = Double
    func sumOfData(a: Double, b:Double) -> Double{
        return a + b
    }
}
let obj1 = MyData1()
let result1 = obj1.sumOfData(a: 20, b: 30)
print("Result1 : \(result1)")


protocol Shape {
    associatedtype T
    func draw()-> T
}
struct Circle : Shape {
    typealias T = Int
    var name = "Circle"
    func draw()-> Int{
        return 1
    }
}
struct Triangle: Shape {
    typealias T =  Double
    var name = "Trianle"
    func draw() -> Double {
        return 1.8
    }
}

}

var names: [String] = ["Anne", "Garry", "Keith"]
let firstName = names[0]
print(firstName)
names[1] = "Paul"
names.insert("Bob", at:3)
let chelsea = names.remove(at:2)
let dan = names.removeLast()
names.count
print(names)
//names.removeAll()
//print(names)



var nam = ["Amy"]
nam.append("Joe")
nam += ["Keith", "Jane"]
print(nam)

var myNewArray = names + nam
print(myNewArray)


var numbers: [Int8] = [1, -3, 50, 72, -95, 115]

let number = [4,5,6]
if numbers.contains(5) {
    print("There is a 5");
}
//var myArray: [Int] = []
//var myArray: Array<Int> = []
//var myArray = [Int()]

var myArr = [Int](repeating: 0, count: 100)
let count = myArr.count
if myArr.isEmpty{}



var a=[1,2,3]
var b=[4,5,6]
var c=[a,b]
print(c)
print(c[0])
print(c[1][1])

var score = ["Amit":50, "Sumit" : 40, "Luke":30]
//print(score["Luke"])
score["Sumit"] = 54
print(score)
let oldValue = score.updateValue(55, forKey:"Sumit")
//if let oldValue = score.updateValue( 100, forKey: "Swastik"){
//    print("\(oldValue)")
//}
//if let oldValue(for key:"Kiran"){
//    print("\(oldValue)")
//}
    

for index in 1..<5 {
    print("The number is \(index).")
}
for _ in 1...5 {
    print("The loop works")
}
let names = ["Karan", "Manish", "Payal", "Gaurav"]

for name in names {
    print(name)
}
for letters in "ABCDE" {
    print(letters)
}
for (index, letter) in "ABCDE".enumerated() {
    print("At index \(index) the letter is \(letter)")
}
for (index, value) in [1,2,3,4].enumerated() {
    print("\(index) and \(value)")
    
}
let namesAndAge = ["Suman" : 25, "Vinay" : 23, "Kajal": 20]
for (name, age) in namesAndAge {
    print("\(name) and \(age)in years")
}
for(_,age) in namesAndAge {
    print(age)
}


var count = 3
while count < 0 {
    print(count)
}

for index in 1...10 {
    print(index)
    if index>6 {
        break
    }
}

import UIKit

//class Animal {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//    func makeSound() {
//        print("Make sound")
//    }
//}
//class Dog : Animal {
//    var breed: String
//    init(name: String, breed: String) {
//        self.breed = breed
//        super.init(name: name)
//    }
//    override func makeSound() {
//        print("Dog sound")
//    }
//    func bark() {
//        print("Bark")
//    }
//}
//let dog = Dog(name: "Max", breed: "Labrador")
//let animal : Animal
//animal = dog
//print(animal.name)
//animal.makeSound()
//class Cat : Animal {
//    var boxSize: Int
//    init(boxSize: Int, breed : String) {
//        self.boxSize = boxSize
//        super.init(name: breed)
//    }
//}
//class Bird : Animal {
//    var featherColor : String
//    init(featherColor: String, name: String) {
//        self.featherColor = featherColor
//        super.init(name: name)
//    }
//}
//func walk(dog:Dog) {
//    print("Walking dog \(dog.name)")
//}
//func cleanLitterBox(cat: Cat) {
//    print("Clean box")
//}
//func cleanCage(bird:Bird) {
//    print("Remove the \(bird.featherColor)")
//}
//
//
//let dogOne = Dog(name: "Max", breed: "Labrador")
//let catOne = Cat(boxSize: 2, breed: "Siamese")
//let birdOne = Bird(featherColor: "Blue", name: "Tweety")
//let pets = [dogOne, catOne, birdOne]
//
////for pet in pets {
////    if pet is Dog {
////        print ("Dog")
////        walk(dog: pet as! Dog)
////    } else if pet is Cat {
////        print("Client is cat")
////        cleanLitterBox(cat: pet as! Cat)
////    } else if pet is Bird {
////        print("client bird")
////    } else {
////        print("exotic pet type")
////    }
////}
//for pet in pets {
//    if let dog = pet as? Dog{
//        print("client pet is \(dog.name) and \(dog.breed)")
//        walk(dog:dog)
//    } else if let cat = pet as? Cat{
//        print("client pet is \(cat.name) and \(cat.boxSize)")
//        cleanLitterBox(cat: cat)
//    }
//}


class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
    func makeSound() {
        print("Make sound")
    }
}
class Dog : Animal {
    var breed: String
    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }
    override func makeSound() {
        print("Dog sound")
    }
    func bark() {
        print("Bark")
    }
}
var items : [Any] = [5, "Hello", 6.5, Dog(name : "doggy", breed : "Labrodore")]
for item in items {
    if item is Int {
        print("Integr")
    } else if item is String {
        print ("String")
    } else if item is Double {
        print("Double")
    } else if item is Dog {
        print("Item is object")
    }
}

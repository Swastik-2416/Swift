//import UIKit
//
//var greeting = "Hello, playground"
//print("Error handling in swift")
//
////Error Handling
//enum VendingMachineError: Error {
//    case invalidSelection
//    case mechanicalFailure
//    case outOfStock
//    case paymentFailure
//}
////throw VendingMachineError.invalidSelection
//struct Item {
//    var price: Int
//    var name: String
//    var quantity: Int
//}
//var inventory: [String: Item] = [
//    "Drinks": Item(price: 20, name: "Campa", quantity: 2),
//    "Chips": Item(price: 25, name: "Lays", quantity: 1),
//    "Candy": Item(price: 2, name: "Pulse", quantity: 3),
//    "Chocolate": Item(price: 45, name: "Hershey", quantity: 5),
//    "Coffee": Item(price: 199, name: "Sleepy Owl", quantity: 10)
//]
//
////var itemName:String = "Drinks"
////var quanity: Int = 2
////var amount: Int = 20
//
////let someItem = inventory[itemName]
////guard let availableItem = inventory[itemName]  else {
////    throw VendingMachineError.invalidSelection
////}
////if availableItem.quantity < quanity {
////    throw VendingMachineError.outOfStock
////}
////if availableItem.price*quanity > amount {
////    throw VendingMachineError.paymentFailure
////}
//func dispense(_quantity:Int, of item:String, for payment:Int, from inventory:[String:Item]) throws-> String{
//    var message = "Oder under Process"
//    defer {
//        print("Almost done quitiing")
//    }
//    defer {
//        print("Done quitiing")
//    }
//    guard let availableItem = inventory[item]  else {
//        throw VendingMachineError.invalidSelection
//    }
//    if availableItem.quantity < _quantity {
//        throw VendingMachineError.outOfStock
//    }
//    if availableItem.price*_quantity > payment {
//        throw VendingMachineError.paymentFailure
//    }
//    else if Bool.random(){
//        throw VendingMachineError.mechanicalFailure
//    }
//    message = "Dispensing \(_quantity) \(item)"
//    return message
//}
//
////Approach1
//do {
//    let result = try dispense(_quantity: 2, of: "Drinks", for: 40, from: inventory)
//    print(result)
//} catch VendingMachineError.invalidSelection{
//    print("you selected a weird item")
//} catch VendingMachineError.outOfStock{
//    print("we are out of stock")
//} catch VendingMachineError.paymentFailure{
//    print("you need to pay more")
//} catch VendingMachineError.mechanicalFailure{
//    print("Machine is out of order")
//}
//
////Approach2
//if let screenMessage = try? dispense(_quantity: 4, of: "Drinks", for: 40, from: inventory) {
//    print(screenMessage)
//} else {
//    print("Some error was thrown")
//}
//
////Approach3
//let screenMessage2 = try! dispense(_quantity: 4, of: "Something", for: 0, from: [:])
//
//func vend() throws{
//    var inventory: [String: Item] = [
//        "Drinks": Item(price: 20, name: "Campa", quantity: 2),
//        "Chips": Item(price: 25, name: "Lays", quantity: 1),
//        "Candy": Item(price: 2, name: "Pulse", quantity: 3),
//        "Chocolate": Item(price: 45, name: "Hershey", quantity: 5),
//        "Coffee": Item(price: 199, name: "Sleepy Owl", quantity: 10)
//    ]
//    let someMessage = try? dispense(_quantity: 2, of: "Drinks", for: 40, from: inventory)
//}
//let anotherMessage = try? dispense(_quantity: 2, of: "Drinks", for: 40, from: [:])

enum BankError: Error {
    case insufficientFunds
    case invalidAmount
    case accountLocked
}


struct BankAccount {
    var balance: Int
    var isLocked: Bool = false
    
    mutating func withdraw(_ amount: Int) throws {
        defer {
            print("Thank you for banking with us")
        }
        defer {
            print("Transaction Complete")
        }
        if isLocked {
            throw BankError.accountLocked
        }
        else if amount > balance {
            throw BankError.insufficientFunds
        }
        else if amount <= 0 {
            throw BankError.invalidAmount
        }
        balance -= amount
        
    }
}
var account = BankAccount(balance: 1000)

do {
    let message: () = try account.withdraw(200)
    print(message)
} catch BankError.insufficientFunds {
    print("Insufficient Funds")
} catch BankError.invalidAmount {
    print("Invalid Amount")
} catch BankError.accountLocked {
    print("Account Locked")
}


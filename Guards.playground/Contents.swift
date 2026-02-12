import UIKit

//func singHappyBirthday() {
//    let isBirthdayToday = true
//    let invitedGuestList = [String]()
//    let isCandleLit = true
//    
//    if isBirthdayToday {
//        if !invitedGuestList.isEmpty {
//            if isCandleLit {
//                print("Happy Birthday to you!")
//            } else {
//                print("Candles not lit yet!")
//            }
//        } else {
//            print("A family party!")
//        }
//    } else {
//        print("No party today!")
//    }
//}


//func singHappyBirthday() {
//    let isBirthdayToday = true
//    let invitedGuestList = [String]()
//    let isCandleLit = true
//    
//    if !isBirthdayToday {
//        print("No party")
//        return
//    }
//    if invitedGuestList.isEmpty{
//        print("It is a family party")
//        return
//    }
//    if !isCandleLit {
//        print("Cake candles not lit yet")
//        return
//    }
//    print("HAPPY BITHDAY TO YOU")
//
//}


// guard condition else {
//}fallthrouh
func singHappyBirthday() {
    let isBirthdayToday = true
    let invitedGuestList = [String]()
    let isCandleLit = true
    
    guard isBirthdayToday else {
        print("No party")
        return
    }
    guard !invitedGuestList.isEmpty else{
        print("It is a family party")
        return
    }
    guard isCandleLit else {
        print("Cake candles not lit yet")
        return
    }
    print("HAPPY BITHDAY TO YOU")
        
}


struct Book {
    let name: String
    let publishedYear: Int?
}
let firstBook = Book(name: "Harry Porter", publishedYear: 1997)
let secondBook = Book(name: "Dan Brown", publishedYear: 1998)
let unannouncedBook = Book(name: "IOs", publishedYear: nil)

//func printYear(book:Book) {
//    if let possibleYear = book.publishedYear, {
//        print(possibleYear)
//    }
//    print(possibleYear)
//}

func printYear (book:Book){
    guard let possibleYear = book.publishedYear else {
        print("No book published this year")
        return
    }
    print(possibleYear)
}

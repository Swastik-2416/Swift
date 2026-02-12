S1import UIKit
struct Book {
    var name: String
    var publicationYear: Int?
}
let firstBook = Book(name: "A Christmas Carol", publicationYear: 1960)
let secondBook = Book(name: "A Tale of two cities", publicationYear: 1949)
let unamedBook = Book(name: "Rables nd Lions", publicationYear: nil)

//if firstBook.publicationYear != nil {
//    let actualYear = firstBook.publicationYear!
//    print(actualYear)
//}
//else {
//    print("Not yet published")
//}
//let actualType = unamedBook.publicationYear!
//print(actualType)
if let actualYear = unamedBook.publicationYear {
    print(actualYear)
}

let string1 = "123"
let possibleNumber1 = Int(string1)
print(possibleNumber1)


let string2 = "HEllo"
let possibleNumber2 = Int(string2)
print(possibleNumber2)


func printFullName(firstName: String, middleName: String?=nil, lastName: String) {
    print("Full Name is \(firstName), \(middleName ?? ""), \(lastName)")
    
}
printFullName(firstName: "Swastik", lastName: "Mandal")


struct Todler {
    var name: String
    var monthsOlds: Int
    init?(name: String, monthsOld: Int) {
        if monthsOld < 12 || monthsOld > 36{
            return nil;
        }
        self.name = name
        self.monthsOlds = monthsOld
    }
    
}
let todler = Todler(name: "Swastik" monthsOld: 37")
                    if let mytodler = todler {
    
}


struct Person {
    var age: Int
    var residence: Residence?
}
struct Residence {
    var address: Address?
}
struct Address {
    var buildingNumber: String
    var streetNumber : String
    var apartmentNumber: String?
}
let address = Address(buildingNumber: "B1", streetNumber: "S1", apartmentNumber: "A1")
let residence = Residence(address: address)
let person = Person(age: 20, residence:residence)
//if let theResidence = person.residence{
//    if let theResidence = person.residence {
//        if let theAddress = theResidence.adress {
//            if let theApartmentNumber = theAddress.apartmentNumber
//        }
//    }
//}
                    
if let theApartmentNumber = person.residence?.address?.apartmentNumber{
    print("The person has a apartment number \(theApartmentNumber)")
}

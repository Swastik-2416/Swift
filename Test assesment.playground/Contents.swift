//📘 Problem Statement
//You are working on a Learning App.
//Users of the app can be Students or Instructors.
//Because data is fetched from a network, some values may be missing.
//Your task is to safely grant access using Swift best practices.
//✅ Given Code
//⚠ Do NOT modify the code below

class User {
    
}
class Student: User {
    let name: String?
    let score: String?
    
    init (name: String?, score: String?) {
        self.name = name
        self.score = score
    }
}
class Instructor: User {
    let subject: String?
    init(subject: String?) {
        self.subject = subject
    }
}
//🎯 Task
//Implement the function below:


func grantAccess(to user: User?) {
    guard let user = user else {
        print("No user found")
        return
    }
    if let student = user as? Student {

        guard
            let name = student.name,
            let scoreString = student.score,
            let score = Int(scoreString)
        else {
            print("Access denied ")
            return
        }

        print("\(name), your score is \(score)")
        return
    }
    if let instructor = user as? Instructor {

        guard let subject = instructor.subject else {
            print("incomplete data")
            return
        }

        print("Instructor access granted for \(subject)")
        return
    }
    print("Access denied")
}
grantAccess(to: nil)
let invalidStudent = Student(name: nil, score:"2")
grantAccess(to: invalidStudent)
let validStudent = Student(name: "Swastik", score: "88")
grantAccess(to: validStudent)
let missingName = Student(name: nil, score: "85")
grantAccess(to: missingName)
let validIns = Instructor(subject: "Swift")
grantAccess(to: validIns)
let unknownUser = User()
grantAccess(to: unknownUser)



//📌 Functional Requirements
//Your implementation must:
//1. If user is nil
//→ Print "No user found" and exit early
//2. 3. 4. 5. Identify whether the user is a Student or an Instructor
//If the user is a Student
//◦ Safely unwrap name
//◦ Convert score from String to Int
//◦ If successful, print:
//Welcome <name>, your score is <score>
//If the user is an Instructor
//◦ Safely unwrap subject
//◦ Print:
//Instructor access granted for <subject>
//If any required data is missing or invalid
//→ Print "Access denied due to incomplete data"
//🚫 Constraints
//• ❌ Do NOT use force unwrapping (!)
//• ✅ Use guard for early exit
//• ✅ Use safe type casting (as?)
//• ✅ Code must be readable and safe





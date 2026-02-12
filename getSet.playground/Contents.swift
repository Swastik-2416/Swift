import UIKit

struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.width/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
            
        }
    }
}
var square = Rect(origin:  Point(x:0.0, y:0.0), size: Size(width: 10, height: 10))
print("center of square is: \(square.center)")
let initialSquareCenter = square.center
square.center = Point (x:15, y:15)
print(square.origin)



struct StepCounter {
    var totalSteps: Int=0 {
        willSet {
            print ("total steps will be chnged to \(newValue)" )
        } didSet {
            
            print("Vslue is changed from \(oldValue) to \(totalSteps)")
        }
    }
    
}
var myStepCounter = StepCounter()
myStepCounter.totalSteps=40
print(myStepCounter.totalSteps)
myStepCounter.totalSteps=100


struct StepCounter {
    static let initialTotalSteps = 0
    let name: String
}
let myStepCounter = StepCounter(name: "XXX")
StepCounter.initialTotalSteps()


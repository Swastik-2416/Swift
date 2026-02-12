import UIKit

//struct Rectangle {
//    private var _height: Int = 0
//    private var _width: Int = 0
//    var height: Int {
//        get { _height }
//        set { _height = min(newValue,12) }
//    }
//    var width: Int {
//        get { _width }
//        set { _width = min(newValue,12) }
//    }
//}
//var rect = Rectangle()
//print(rect.height)
//print(rect.width)
//rect.height = 15
//rect.width = 10
//print(rect.height)
//print(rect.width)
//
//
//struct temperature {
//    var celsius: Double
//    var fahrenheit: Double {
//        get {
//            return celsius * 1.8 + 32
//        } set {
//            celsius = (newValue - 32) * 1.8
//        }
//    }
//}
//var currentTemp = temperature(celsius: 0)
//print(currentTemp.fahrenheit)
//currentTemp.fahrenheit = 212
//print(currentTemp.celsius)
//


//@propertyWrapper
//struct TweleveOrLess {
//    private var number = 0
//    private var max = 0
//    var wrappedValue: Int {
//        get { number }
//        set { number = min(newValue, max) }
//    }
//    init() {
//        max=12
//        number = 0
//        
//    }
//    init (wrappedValue: Int) {
//        self.max = 12
//        number = min(wrappedValue, 12)
//    }
//    init (wrappedValue: Int, max:Int) {
//        self.max = max
//        number = min(wrappedValue, max)
//    }
//    
//}
//struct ZeroRectangle {
//    @TweleveOrLess var height: Int
//    @TweleveOrLess var width: Int
//}
//var zeroRectangle = ZeroRectangle()
//print(zeroRectangle.height, zeroRectangle.width)
//
//
//struct UnitRectangle{
//    @TweleveOrLess var height: Int = 1
//    @TweleveOrLess var width: Int = 1
//}
//var unitRectangle = UnitRectangle()
//print(unitRectangle.height, unitRectangle.width)
//
//
//struct NarrowRectangle{
//    @TweleveOrLess(wrappedValue: 2, max: 5) var height:Int
//    @TweleveOrLess(wrappedValue: 3, max: 4) var width: Int
//}
//var narrowRectangle = NarrowRectangle()
//print(narrowRectangle.height, narrowRectangle.width)
//narrowRectangle.height=100
//narrowRectangle.width=100
//print(narrowRectangle.height, narrowRectangle.width)
//
//
//struct MixedRectangle {
//    @TweleveOrLess var height: Int = 1
//    @TweleveOrLess(wrappedValue: 5) var width: Int
//}
//var mixedRectangle = MixedRectangle()
//print(mixedRectangle.height, mixedRectangle.width)
//
//
//struct Rectangle {
//    @TweleveOrLess var height: Int
//    @TweleveOrLess var width: Int
//}
//var rect = Rectangle()
//print(rect.height)
//print(rect.width)
//rect.height = 15
//rect.width = 10
//print(rect.height)
//print(rect.width)



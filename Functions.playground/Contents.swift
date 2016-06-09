//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, playground")
}

printGreeting()
func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name) ,welcome to your playground")
    }
}
printPersonalGreetings("Alex","Chris","Drew","Pat")
func divisionDescription(forNumerator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") -> String {
    return ("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}
divisionDescription(forNumerator: 9.0, andDenominator: 3.0)
divisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!")

var error = "The request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error

func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height;
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangle(withBase: 3.0, andHeight: 5.0)

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens);the odd numbers are: \(theSortedNumbers.odds)")

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Matt",nil,"Mathias"))
if let theName = middleName {
    print(theName)
}

func greetByMiddleName(name: (first:String, middle:String?,last:String)) {
    guard let middleName = name.middle where name.middle?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 4 else {
        print("hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(("Matt", "Dang", "Mathias"))

func beanSifter(groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries  = [String]()
    
    for grocery in groceryList {
        if grocery.hasSuffix("beans") {
            beans.append(grocery)
        } else {
            otherGroceries.append(grocery)
        }
    }
    return (beans,otherGroceries)
}

let result = beanSifter(["green beans", "milk", "black beans", "pinto beans", "apples"])
result.beans
result.otherGroceries




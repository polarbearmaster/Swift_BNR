//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
    var distance: Double {
        return hypot(Double(x), Double(y))
    }
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.distance == rhs.distance
}

func <(lhs: Point, rhs: Point) -> Bool {
    return lhs.distance < rhs.distance
}

func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEqual = (a == b)

let c = Point(x: 3, y: 4)
let d = Point(x: 4, y: 3)

let cdEqual = (c == d)

let cLessThanEqualD = (c <= d)
let cGreaterThanEqualD = (c >= d)


let cGreaterThanD = (c > d)
let cLessThanD =  (c < d)
let cEqualToD = (c == d)

let abPlus = c + b
print(abPlus)

//class Person:Equatable {
//    var name: String
//    var age: Int
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//func ==(lhs: Person, rhs: Person) -> Bool {
//    return (lhs.name == rhs.name) && (lhs.age == rhs.age)
//}
//
//let p1 = Person(name: "peter", age: 26)
//let p2 = Person(name: "Jack", age: 28)
//
//var people = [Person]()
//people.append(p1)
//people.append(p2)
//
//let p1Index = people.indexOf(p1)

class Person:Equatable {
    var name: String
    weak var spouse: Person?
    
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.name == rhs.name) && (lhs.spouse == rhs.spouse)
}

infix operator +++ {}
func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)
matt +++ drew
matt.spouse?.name
drew.spouse?.name
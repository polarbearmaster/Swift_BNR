//: Playground - noun: a place where people can play

import Cocoa

func greeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changename(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

var p = Person()
//let changer = Person.changename
//changer(&p)("John", ln: "Gallagher")
p.changename("John", ln: "Gallagher")
p.firstName
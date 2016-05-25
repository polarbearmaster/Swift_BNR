//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 5422
var message: String

if population < 10000 {
    message = "\(population) is a small town!"
} else {
    message = "\(population) is pretty big!"
}

let y: Int8 = 120
let z = y &+ 10

let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3

if d1 == d2 {
    print("d1 and d2 are the same!")
}

print("d1+0.1 is \(d1+0.1)")
if d1+0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}

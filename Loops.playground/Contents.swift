//: Playground - noun: a place where people can play

import Cocoa

var myFirstInt: Int = 0
for _ in 1...5 {
    ++myFirstInt
    print(myFirstInt)
}

for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

for var i = 1; i < 6; ++i {
    ++myFirstInt
    print(myFirstInt)
}

var i = 1
while i < 6 {
    ++myFirstInt
    print(myFirstInt)
    ++i
}

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    if blastersOverheating {
        print("Blasters are overheated! Cooldown initiated")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    // Fire blasters!
    print("Fire blasters!")
    ++blasterFireCount
    ++spaceDemonsDestroyed
}


for _ in 1...5 {
    for case let i in 0...100 where i % 2 == 0 {
        print(i)
    }
}

//: Playground - noun: a place where people can play

import Cocoa

var bucketList = ["Climb Mt. Everest"]
var newItems = ["Fly hot air ballon to Fiji",
                "Watch the Lord of the Rings trilogy in one day",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]
bucketList += newItems

bucketList.removeAtIndex(2)
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " in Austialia"
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", atIndex: 2)
bucketList

var myronsList = ["Climb Mt. Kilimanjaro",
                  "Fly hot air ballon to Fiji",
                  "Toboggan across Alaska",
                  "Go on a walkabout in Austialia",
                  "Scuba dive in the Great Blue Hole",
                  "Find a triple rainbow"
                ]
let euqal = (bucketList == myronsList)

let lunches = ["Cheeseburger",
               "Veggie Pizza",
               "Chicken Caesar Salad",
               "Black Bean Burrito",
               "Falafel wrap"
            ]
var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
//var reversedList: [String] = []
////for var i = toDoList.count - 1; i >= 0; i-- {
////    reversedList.append(toDoList[i])
////}
//reversedList = toDoList.reverse()
//reversedList

for i in 0...(toDoList.count - 1) {
    toDoList.insert(toDoList.popLast()!, atIndex: i)
}
toDoList

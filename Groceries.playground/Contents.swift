//: Playground - noun: a place where people can play

import Cocoa

var groceryBag: Set = ["Apples","Oranges","Pineapple"]
for food in groceryBag {
    print(food)
}
let hasBananas = groceryBag.contains("Bananas")
let friendsGroceryBag = Set(["Bananas","Cereal", "Milk", "Oranges"])
var commonGroceryBag = groceryBag.union(friendsGroceryBag)
groceryBag.unionInPlace(friendsGroceryBag)

var roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roommatesGroceryBag)
commonGroceryBag.intersectInPlace(roommatesGroceryBag)
let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)
let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])
let superSet = myCities.isSupersetOf(yourCities)


//
//  main.swift
//  CyclicalAssets
//
//  Created by kenny on 08/11/2016.
//  Copyright © 2016 yuneec. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
var steve: Person? = Person(name: "Steve")
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.0)
var hat:Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.takeOwnershipOfAsset(laptop!)
steve?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(hat!)

print("While Bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print("the bob variable is now \(bob)")
print("After Bob is dallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil

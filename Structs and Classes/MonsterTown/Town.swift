//
//  Town.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStoplights = 4
    
    func printTownDescription() {
       print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStoplights)")
    }
    
    mutating func changePopulation(amout: Int) {
        if (population + amout >= 0) {
            population += amout
        } else {
            population = 0
        }
    }
}
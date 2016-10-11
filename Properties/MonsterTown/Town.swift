//
//  Town.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

struct Town {
    var mayor =  Mayor()
    static let region = "South"
    var population = 5422 {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayor.printMayorDescription()
            }
        }
    }
    var numberOfStoplights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDescription() {
       print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(amout: Int) {
        if (population + amout >= 0) {
            population += amout
        } else {
            population = 0
        }
    }
}
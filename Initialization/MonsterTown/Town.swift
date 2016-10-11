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
    let region : String
    var population : Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayor.printMayorDescription()
            }
        }
    }
    var numberOfStoplights : Int
    
    init?(region: String, population: Int, stoplights: Int) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    init?(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
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
       print("Population: \(population), number of stoplights: \(numberOfStoplights); region: \(region)")
    }
    
    mutating func changePopulation(amout: Int) {
        if (population + amout >= 0) {
            population += amout
        } else {
            population = 0
        }
    }
}
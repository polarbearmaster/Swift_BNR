//
//  Monster.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr"
    }
    var town : Town?
    var name = "Monster"
    var victimPool : Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
            town?.mayor.afterZombieAttack()
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
    
}
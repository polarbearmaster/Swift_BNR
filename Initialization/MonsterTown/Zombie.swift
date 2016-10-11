//
//  Zombie.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp : Bool
    private(set) var isFallingApart : Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    
    required convenience init(town: Town?, monsterName: String!) {
        //walksWithLimp = false
        //isFallingApart = false
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
        //super.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(-10)
        }
        
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
}
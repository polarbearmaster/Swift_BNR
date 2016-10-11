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
    
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
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
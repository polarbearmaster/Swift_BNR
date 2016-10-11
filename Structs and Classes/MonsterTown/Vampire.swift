//
//  Vampire.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    var vampires = [Vampire]()
    
    override func terrorizeTown() {
        if town?.population > 0 {
            let vampire  = Vampire()
            vampires.append(vampire)
            town?.changePopulation(-1)
        } else {
            print("This town has no one to turn!")
        }
        super.terrorizeTown()
        print("There are \(vampires.count + 1) vampires in this town!")
    }
}
//
//  Mayor.swift
//  MonsterTown
//
//  Created by kenny on 11/10/2016.
//  Copyright © 2016 polarbear. All rights reserved.
//

import Foundation

struct Mayor {
    private var anxietyLevel = 0
    func printMayorDescription() {
        print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
    }
    
    mutating func afterZombieAttack() {
        anxietyLevel += 1
    }
    
    func printAnxietyLevel() {
        print("anxietyLevel: \(anxietyLevel)")
    }
}
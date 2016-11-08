//
//  Person.swift
//  CyclicalAssets
//
//  Created by kenny on 08/11/2016.
//  Copyright © 2016 yuneec. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name : String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in self?.netWorthDidChange(netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        guard asset.owner == nil else {
            print("Asset \(asset.name) is already owned by \(asset.owner!.name)")
            return
        }
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }
    
    func giveupOwnershipOfAsset(asset: Asset) {
        for (index, item) in assets.enumerate() {
            if item === asset {
                assets.removeAtIndex(index)
                asset.owner = nil
                accountant.removedAsset(asset)
            }
        }
    }
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}
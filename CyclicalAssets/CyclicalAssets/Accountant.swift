//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by kenny on 08/11/2016.
//  Copyright © 2016 yuneec. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> ()
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }
    
    func removedAsset(asset: Asset) {
        netWorth -= asset.value
    }
}
//
//  Pump.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation

protocol Pump {
    func pump()
}

class Thermoshiphon : Pump {
    let heater: Heater
    
    init(heater: Heater) {
        self.heater = heater
    }
    
    func pump() {
        if (heater.isHot) {
            print("=> => pumping => =>")
        }
    }
}

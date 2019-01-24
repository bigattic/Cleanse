//
//  CoffeeMaker.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

class CoffeeMaker {
    let heater: Provider<Heater>
    let pump: Pump
    
    init(heater: Provider<Heater>, pump: Pump) {
        self.pump = pump
        self.heater = heater
    }
    
    func brew() {
        heater.get().on()
        pump.pump()
        print(" [_]P coffee! [_]P ")
        heater.get().off()
    }
}

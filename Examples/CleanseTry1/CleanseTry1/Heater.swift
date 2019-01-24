//
//  Heater.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation

protocol Heater {
    func on()
    func off()
    var isHot: Bool { get }
}

class ElectricHeater : Heater {
    private var heating = false
    
    var isHot: Bool {
        return heating
    }
    
    func on() {
        print("~ ~ ~ Heating ~ ~ ~")
        heating = true
    }
    
    func off() {
        heating = false
    }
}

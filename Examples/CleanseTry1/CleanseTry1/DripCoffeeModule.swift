//
//  DripCoffeeModule.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct DripCoffeeModule : Module {
    static func configure(binder: Binder<Singleton>) {
        binder.include(module: PumpModule.self)
        binder
            .bind(Heater.self)
            .sharedInScope()
            .to(factory: ElectricHeater.init)
    }
}

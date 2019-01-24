//
//  PumpModule.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct PumpModule : Module {
    static func configure(binder: Binder<Unscoped>) {
        binder
            .bind(Pump.self)
            .to(factory: Thermoshiphon.init)
    }
}

//
//  CoffeeMakerComponent.swift
//  CleanseTry
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct CoffeeMakerComponent : RootComponent {
    typealias Root = CoffeeMaker
    
    static func configureRoot(binder bind: ReceiptBinder<CoffeeMaker>) -> BindingReceipt<CoffeeMaker> {
        return bind.to(factory: CoffeeMaker.init)
    }
    
    static func configure(binder: Binder<Singleton>) {
        binder.include(module: DripCoffeeModule.self)
    }
}

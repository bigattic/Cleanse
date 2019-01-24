//
//  FakeAPIModule.swift
//  CleanseTry2
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct FakeAPIModule : Module {
    static func configure(binder: Binder<Network>) {
        binder
            .bind(FakeListMembersServiceImpl.self)
            .sharedInScope()
            .to(factory: FakeListMembersServiceImpl.init)
    }
}

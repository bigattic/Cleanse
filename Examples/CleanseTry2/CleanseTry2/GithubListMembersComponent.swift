//
//  GithubListMembersComponent.swift
//  CleanseTry2
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct GithubListMembersComponent : RootComponent {
    // When we build this Component we want to return `GithubListMembersService`.
    typealias Root = GithubListMembersService
    
    static func configureRoot(binder bind: ReceiptBinder<GithubListMembersService>) -> BindingReceipt<GithubListMembersService> {
        // Toggle this value to switch between hitting a real and fake service.
        let fakeMode = true
        
        return bind.to(factory: { (fake: FakeListMembersServiceImpl, real: GithubListMembersServiceImpl) -> GithubListMembersService in
            return fakeMode ? fake : real
        })
    }
    
    static func configure(binder: Binder<Network>) {
        // Install both the fake and real modules we defined earlier.
        binder.include(module: FakeAPIModule.self)
        binder.include(module: GithubAPIModule.self)
    }
}

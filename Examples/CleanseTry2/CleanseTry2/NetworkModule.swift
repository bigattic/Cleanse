//
//  NetworkModule.swift
//  CleanseTry2
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

/// The `NetworkModule` provides an `URLSession`.
struct NetworkModule : Module {
    static func configure(binder: Binder<Network>) {
        //: Provide `URLSessionConfiguration.ephemeral` when a `URLSessionConfiguration` is required.
        binder
            .bind()
            .sharedInScope()
            .to { URLSessionConfiguration.ephemeral }
        //: Provide `URLSession`. It depends on `URLSessionConfiguration` configured above (`$0`).
        binder
            .bind()
            .sharedInScope()
            .to {
                URLSession(
                    configuration: $0,
                    delegate: nil,
                    delegateQueue: OperationQueue.main
                )
        }
    }
}

//
//  GithubAPIModule.swift
//  CleanseTry2
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation
import Cleanse

struct GithubAPIModule : Module {
    static func configure(binder: Binder<Network>) {
        binder.include(module: NetworkModule.self)
        
        // Configure the base URL for Github's API to be `"https://api.github.com"`
        binder
            .bind()
            .tagged(with: GithubBaseURL.self)
            .to(value: URL(string: "https://api.github.com")!)
        binder
            .bind(GithubListMembersServiceImpl.self)
            .sharedInScope()
            .to { (githubURL: TaggedProvider<GithubBaseURL>, urlSession: URLSession) in
                return GithubListMembersServiceImpl(githubURL: githubURL.get(), urlSession: urlSession)
        }
    }
}

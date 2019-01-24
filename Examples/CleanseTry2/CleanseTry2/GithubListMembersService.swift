//
//  GithubListMembersService.swift
//  CleanseTry2
//
//  Created by mmm on 24/01/2019.
//  Copyright © 2019 mmm. All rights reserved.
//

import Foundation

/// Simple Service that lists "Member" logins for the current organization.
protocol GithubListMembersService {
    func listMembers(for orgName: String, handler: @escaping ([String]) -> Void)
}

/// Implementation of GithubListMembersService. It requires a base URL and an `URLSession`.
struct GithubListMembersServiceImpl : GithubListMembersService {
    let githubURL: URL
    let urlSession: URLSession
    
    func listMembers(for orgName: String, handler: @escaping ([String]) -> Void) {
        let url = githubURL.appendingPathComponent("orgs/\(orgName)/public_members")
        
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            // For simplicity of example, just yield an empty list if the request wasn't successful
            guard let data = data, let result = (try?
                JSONSerialization.jsonObject(with: data, options: [])) as?
                    [[String: AnyObject]] else {
                        handler([])
                        return
            }
            handler(result.compactMap { $0["login"] as? String })
        }
        dataTask.resume()
    }
}

/// Fake implementation of GithubListMembersService. This doesn't hit the network and thus doesn't require anything.
struct FakeListMembersServiceImpl : GithubListMembersService {
    func listMembers(for orgName: String, handler: @escaping ([String]) -> Void) {
        handler(["Fake #1", "Fake #2", "Fake #3"])
    }
}

//
//  NetworkManager.swift
//  weathery
//
//  Created by bruze on 12/5/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
import Reachability

struct NetworkRequestParameters {
    let endpoint: String
    let method  : String
    let parameters: String
}

protocol NetworkManager {
    var baseURL: String { get }
    var networkReachable: Bool { get set }
    func makeURLRequest(parameters: NetworkRequestParameters) throws -> URLRequest
}

extension NetworkManager {
    var baseURL: String { return Bundle.mainInfoValue(for: "baseURL") }
    
    func makeURLRequest(parameters: NetworkRequestParameters) throws -> URLRequest {
        guard self.networkReachable else {
            throw RequestError.NetworkUnreachable
        }
        let url = URL(string: "\(self.baseURL + parameters.endpoint)\(parameters.parameters)")
        var request = URLRequest(url: url!)
        request.httpBody = nil
        request.httpMethod = parameters.method
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
        return request
    }
}

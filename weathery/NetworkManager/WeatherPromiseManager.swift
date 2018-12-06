//
//  WeatherPromiseManager.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
import Reachability

enum RequestError: Error {
    case NetworkUnreachable
}

final class WeatherPromiseManager: PromiseManager {
    var baseURL: String { return Bundle.mainInfoValue(for: "baseURL") }
    private var reachability = Reachability()
    var networkReachable: Bool = false
    
    typealias PromiseType = WeatherModel
    
    init() {
        //NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        //do{
            //try reachability?.startNotifier()
            if let reachability = reachability {
                self.networkReachable = reachability.connection != .none
            }
        /*}catch{
            print("Could not start reachability notifier")
        }*/
    }
    
    @objc func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else { return }
        
        switch reachability.connection {
        case .none:
            self.networkReachable = false
        case _:
            self.networkReachable = true
        }
    }
    
    func makeURLRequest(parameters: NetworkRequestParameters) throws -> URLRequest {
        guard self.networkReachable else {
            throw RequestError.NetworkUnreachable
        }
        let url = URL(string: "\(self.baseURL + parameters.endpoint)?\(parameters.parameters)")
        var request = URLRequest(url: url!)
        request.httpBody = nil
        request.httpMethod = parameters.method
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
        return request
    }
}

//
//  PromiseManager.swift
//  weathery
//
//  Created by bruze on 12/5/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
import PromiseKit

protocol PromiseManager: NetworkManager {
    associatedtype PromiseType: Codable
    
    func handlePromise(onSuccess: @escaping (PromiseType) -> (), onError: @escaping (Error) -> ())
}

extension PromiseManager /*where PromiseType == WeatherModel*/ {
    func handlePromise(onSuccess: @escaping (PromiseType) -> (), onError: @escaping (Error) -> ()) {
        firstly {
            URLSession.shared.dataTask(.promise, with: try self.makeURLRequest(parameters: NetworkRequestParametersFactory.weatherIn(city: "London"))).validate()
            }.map {
                try JSONDecoder().decode(PromiseType.self, from: $0.data)
            }.done { foo in
                onSuccess(foo)
            }.catch { error in
                onError(error)
        }
    }
}

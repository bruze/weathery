//
//  NetworkRequestParametersFactory.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
struct NetworkRequestParametersFactory {
    static func weatherIn(city: String) -> NetworkRequestParameters {
        return NetworkRequestParameters(endpoint: "/data/2.5/weather", method: "GET", parameters: "q=\(city)&APPID=\(Bundle.mainInfoValue(for: "apiKey"))")
    }
}

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
    
    static func weatherIn(cities citiesIds: [Int] = [3441572, 2643743, 3448439, 3435910, 3220838]) -> NetworkRequestParameters {
        let cities = String(citiesIds.map({ String($0) }).reduce("", { $0 + "," + $1 }).dropFirst())
        return NetworkRequestParameters(endpoint: "/data/2.5/group", method: "GET", parameters: "id=\(cities)&APPID=\(Bundle.mainInfoValue(for: "apiKey"))")
    }
}

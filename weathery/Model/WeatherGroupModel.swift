//
//  WeatherGroupModel.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
struct WeatherGroupModel: Codable {
    let cnt: Int
    let list: [WeatherModel]
}

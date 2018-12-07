//
//  WeatherModel.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
struct WeatherModel: Codable {
    let coord: coord
    let weather: [weather]
    let base: String?
    let main: main
    let visibility: Int?
    let wind: wind
    let clouds: clouds
    let dt: Int
    let sys: sys
    let id: Int
    let name: String
    let cod: Int?
    
    struct coord: Codable {
        let lon: Double
        let lat: Double
    }
    struct weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    struct main: Codable {
        let temp: Double
        let pressure: Double
        let humidity: Int
        let temp_min: Double
        let temp_max: Double
    }
    struct wind: Codable {
        let speed: Double
        let deg: Double
    }
    struct clouds: Codable {
        let all: Int
    }
    struct sys: Codable {
        let type: Int?
        let id: Int?
        let message: Double
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}

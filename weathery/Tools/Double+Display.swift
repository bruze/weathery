//
//  Double+Display.swift
//  weathery
//
//  Created by bruze on 12/7/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
extension Double {
    func displayAsTemperature() -> String {
        return String(Int(self)) + "°"
    }
    
    func displayAsMinTemperature() -> String {
        return "MIN " + self.displayAsTemperature()
    }
    
    func displayAsMaxTemperature() -> String {
        return "MAX " + self.displayAsTemperature()
    }
    
    func displayAsSpeed() -> String {
        return String(self) + " Km/h"
    }
    
    func displayAsPressure() -> String {
        return "Pressure: ".localized + String(Int(self)) + " mb"
    }
}

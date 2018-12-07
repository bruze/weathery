//
//  Int+Display.swift
//  weathery
//
//  Created by bruze on 12/7/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
extension Int {
    func displayAsHumidity() -> String {
        return "Humidity: ".localized + String(self) + "%"
    }
}

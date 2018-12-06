//
//  Bundle+Keys.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
extension Bundle {
    static func mainInfoValue(for key: String) -> String {
        guard let info = Bundle.main.infoDictionary,
              let value = info[key] as? String else {
            print("\(key) key not found in Info.plist")
            return ""
        }
        return value
    }
}

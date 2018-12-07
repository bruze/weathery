//
//  Strings+Localized.swift
//  weathery
//
//  Created by bruze on 12/7/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

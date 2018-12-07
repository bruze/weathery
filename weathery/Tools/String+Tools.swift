//
//  String+Tools.swift
//  weathery
//
//  Created by bruze on 12/7/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
extension String {
    public func capitalizeFirst() -> String {
        guard self.count > 0 else { return self }
        var mutable = self
        mutable.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
        return mutable
    }
}

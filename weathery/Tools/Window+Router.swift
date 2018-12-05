//
//  Window+Router.swift
//  weathery
//
//  Created by bruze on 12/5/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
extension UIWindow {
    func loadController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        self.rootViewController = storyboard.instantiateInitialViewController()
        self.makeKeyAndVisible()
    }
}

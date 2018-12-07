//
//  Window+Router.swift
//  weathery
//
//  Created by bruze on 12/5/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
extension UIWindow {
    func loadController(networkManager: WeatherPromiseManager) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainViewController = storyboard.instantiateInitialViewController() as? ViewController else {
            print("Couldn't instantiate MainViewController")
            return
        }
        mainViewController.networkManager = networkManager
        self.rootViewController = mainViewController
        self.makeKeyAndVisible()
    }
}

//
//  ViewController.swift
//  weathery
//
//  Created by bruze on 12/4/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!
    
    internal let locationManager = CLLocationManager()
    internal var networkManager: WeatherPromiseManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        let weatherCell = UINib(nibName: "WeatherCell", bundle: nil)
        self.table.register(weatherCell, forCellReuseIdentifier: "WeatherCell")
    }

    func setup() {
        self.locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse, .authorizedAlways:
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            }
            break
        default:
            break
        }
        
        networkManager?.handlePromise(forRequest: NetworkRequestParametersFactory.weatherIn(), onSuccess: { (weather: WeatherGroupModel) in
            self.table.reloadData()
        }, onError: { (error) in
            print("ERROR")
        })
    }

    func forecastsCount(at section: Int) -> Int {
        let citiesForecastCount = self.networkManager?.citiesForecast.count
        switch (self.networkManager?.forecastAtLocation, section) {
        case (nil, _):
            return citiesForecastCount ?? 0
        case (_, 0):
            return 1
        case (_, _):
            return citiesForecastCount ?? 0
        }
    }
    
    func forecastAt(index: IndexPath) -> WeatherModel? {
        switch (self.networkManager?.forecastAtLocation, index.section) {
        case (nil, _), (_, 1):
            return self.networkManager?.citiesForecast[index.row]
        case (_, 0):
            return self.networkManager?.forecastAtLocation
        default:
            return nil
        }
    }
}


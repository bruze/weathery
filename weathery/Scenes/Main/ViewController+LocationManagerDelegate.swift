//
//  ViewController+LocationManagerDelegate.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import CoreLocation
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .authorizedWhenInUse, .authorizedAlways:
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            }
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastValue = locations.last {
            let coordinates = (Int(lastValue.coordinate.latitude.magnitude), Int(lastValue.coordinate.longitude.magnitude))
            self.networkManager?.handlePromise(forRequest: NetworkRequestParametersFactory.weatherAt(coordinates: coordinates), onSuccess: { (weatherModel: WeatherModel) in
                self.table.reloadData()
            }, onError: { (error) in
                print()
            })
        }
    }
}

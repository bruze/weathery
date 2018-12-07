//
//  WeatherCellFactory.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
struct WeatherCellFactory {
    static func weatherCell(from table: UITableView, using model: WeatherModel) -> WeatherCell? {
        guard let cell = table.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell else {
            return nil
        }
        if let firstIcon = model.weather.first?.icon {
            let iconFetcher = IconPromiseManager()
            iconFetcher.getIcon(for: firstIcon, onSuccess: { (icon) in
                print()
            }) { (error) in
                print()
            }
        }
        return cell
    }
}

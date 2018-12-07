//
//  WeatherCellFactory.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit

struct WeatherCellFactory {
    private static func background(for name: String) -> UIImage {
        switch name {
        case "Departamento de Montevideo":
            return #imageLiteral(resourceName: "montevideo")
        case "London":
            return #imageLiteral(resourceName: "londres")
        case "Sao Paulo":
            return #imageLiteral(resourceName: "san_pablo")
        case "Buenos Aires":
            return #imageLiteral(resourceName: "buenos_aires")
        case "Landkreis München":
            return #imageLiteral(resourceName: "munich")
        default:
            return #imageLiteral(resourceName: "current")
        }
    }
    
    static func weatherCell(from table: UITableView, using model: WeatherModel) -> WeatherCell? {
        guard let cell = table.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell else {
            return nil
        }
        if let firstWeather = model.weather.first {
            let firstIcon = firstWeather.icon
            let iconFetcher = IconPromiseManager()
            iconFetcher.getIcon(for: firstIcon, onSuccess: { (icon) in
                cell.icon.image = icon
            }) { (error) in
                print()
            }
            cell.descriptionLabel.text = firstWeather.description.capitalizeFirst()
        }
        cell.locationLabel.text = model.name
        cell.background.image = background(for: model.name)
        return cell
    }
}

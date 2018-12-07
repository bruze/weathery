//
//  ViewController+Table.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.networkManager?.forecastAtLocation == nil ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecastsCount(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = self.forecastAt(index: indexPath), let weatherCell = WeatherCellFactory.weatherCell(from: tableView, using: model) {
            return weatherCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = tableView.numberOfSections
        switch (sections, section) {
        case (1, _), (2, 1):
            return "TOP CITIES".localized
        case (2, 0):
            return "AT CURRENT LOCATION".localized
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.size.height * 0.1
    }
}

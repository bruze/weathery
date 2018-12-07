//
//  WeatherPromiseManager.swift
//  weathery
//
//  Created by bruze on 12/6/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import Foundation
import Reachability
import PromiseKit

enum RequestError: Error {
    case NetworkUnreachable
    case DataParsingIssue
}

final class WeatherPromiseManager: NSObject, NetworkManager {
    private var reachability = Reachability()
    var networkReachable: Bool = false
    private(set) var citiesForecast = [WeatherModel]()
    private(set) var forecastAtLocation: WeatherModel?

    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability?.startNotifier()
            if let reachability = reachability {
                self.networkReachable = reachability.connection != .none
            }
        }catch{
            print("Could not start reachability notifier")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else { return }
        
        switch reachability.connection {
        case .none:
            self.networkReachable = false
        case _:
            self.networkReachable = true
        }
    }
    
    func handlePromise<P>(forRequest parameters: NetworkRequestParameters, onSuccess: @escaping (P) -> (), onError: @escaping (Error) -> ()) where P : Codable {
        firstly {
            URLSession.shared.dataTask(.promise, with: try self.makeURLRequest(parameters:
                parameters)).validate()
            }.map {
                try JSONDecoder().decode(P.self, from: $0.data)
            }.done { model in
                self.didReceiveData(model: model)
                onSuccess(model)
            }.catch { error in
                onError(error)
        }
    }
    
    func didReceiveData<P>(model: P) where P : Codable {
        if let model = model as? WeatherModel {
            self.forecastAtLocation = model
        } else if let model = model as? WeatherGroupModel {
            self.citiesForecast.append(contentsOf: model.list)
        }
    }
}


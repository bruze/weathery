//
//  IconPromiseManager.swift
//  weathery
//
//  Created by bruze on 12/7/18.
//  Copyright © 2018 bruze. All rights reserved.
//

import UIKit
import PromiseKit

final class IconPromiseManager: NetworkManager {
    var networkReachable: Bool = true
    
    func getIcon(for key: String, onSuccess: @escaping (UIImage) -> (), onError: @escaping (Error) -> ()) {
        let iconParameters = NetworkRequestParametersFactory.iconFor(key: key)
        firstly {
            URLSession.shared.dataTask(.promise, with: try self.makeURLRequest(parameters:
                iconParameters)).validate()
            /*}.map {
                try JSONDecoder().decode(UIImage.self, from: $0.data)*/
            }.done { iconData in
                if let icon = UIImage.init(data: iconData.data) {
                    onSuccess(icon)
                }
                onError(RequestError.DataParsingIssue)
            }.catch { error in
                onError(error)
        }
    }
}

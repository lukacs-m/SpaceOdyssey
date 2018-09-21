//
//  Alert.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 21/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    static func showUnableToRetrieveDataAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Unable to Retrieve Space X Data", message: "Network Error. Please pull the screen to refresh")
    }
}


//
//  LauncheErrors.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

enum LaunchErrors: Error {
    case couldNotLoadLaunches(error: String)
}

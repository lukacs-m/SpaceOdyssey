//
//  LaunchesDataManager.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import PromiseKit

protocol LaunchesNetworkInjected { }

struct LaunchesNetworkInjector {
    static var networkManager: LaunchesDataManager = LaunchesNetworkManager()
}

extension LaunchesNetworkInjected {
    var launchesDataManager: LaunchesDataManager {
        return LaunchesNetworkInjector.networkManager
    }
}

protocol LaunchesDataManager: class {
    func getLaunches() -> Promise<Launches>
}

class LaunchesNetworkManager: LaunchesDataManager {
    func getLaunches() -> Promise<Launches> {
        return APIManager.callApi(SpaceXApi.launches(), dataReturnType: Launches.self)
    }
}

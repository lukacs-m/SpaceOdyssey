//
//  LaunchesDataManagerMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 22/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import PromiseKit
@testable import SpaceOdyssey

class LaunchesNetworkManagerMock: LaunchesDataManager {
    var getLaunchesCalled = false
    
    func getLaunches() -> Promise<Launches> {
        getLaunchesCalled = true
        return APIManager.callApi(SpaceXApi.launches(), dataReturnType: Launches.self, test: true)
    }
}

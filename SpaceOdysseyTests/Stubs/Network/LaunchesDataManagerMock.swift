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

final class LaunchesNetworkManagerMock: LaunchesDataManager {
    var getLaunchesCalled = false
    
    func getLaunches(_ debugMode: Bool = false) -> Promise<Launches> {
        getLaunchesCalled = true
        let test = EnvironmentVariables.spaceOdyssey_test_env.value == "test" ? true : false
        return APIManager.callApi(SpaceXApi.launches(), dataReturnType: Launches.self, test: test)
    }
}

//
//  LaunchMocks.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 22/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
@testable import SpaceOdyssey

extension Launch {
    static let validLaunch : JSONValue = [
        "flight_number": 3,
        "mission_name": "test mission",
        "mission_id": ["mission ID 1"],
        "upcoming": false,
        "launch_year": "",
        "launch_date_unix": 1234,
        "launch_date_utc": "",
        "launch_date_local": "",
        "is_tentative": true,
        "launch_success":  true,
        "details": "test details",
        "static_fire_date_utc": "test",
        "static_fire_date_unix": 12
    ]
}

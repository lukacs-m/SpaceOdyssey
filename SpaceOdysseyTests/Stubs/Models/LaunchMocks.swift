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
        "flight_number":68,
        "mission_name":"Telstar 18V",
        "mission_id":[
            "F4F83DE"
        ],
        "launch_year":"2018",
        "launch_date_unix":1536554700,
        "launch_date_utc":"2018-09-10T04:45:00.000Z",
        "launch_date_local":"2018-09-10T00:45:00-04:00",
        "is_tentative":false,
        "tentative_max_precision":"hour",
        "rocket": Rocket.validRocket,
        "ships":[
            "OCISLY",
            "HAWK",
            "GOQUEST"
        ],
        "telemetry": Telemetry.validTelemetry,
        "reuse": Reuse.validReuse,
        "launch_site": LaunchSite.validLaunchSite,
        "launch_success":true,
        "links":Links.validLinks,
        "details":"SpaceX's sixteenth flight of 2018 launched the Telstar 18v GEO communication satellite for Telesat, the second launch for the canadian company in a few months. The first stage was a new Falcon 9 V1.2 Block 5 which was successfully recovered on OCISLY.",
        "upcoming":false,
        "static_fire_date_utc":"2018-09-05T07:21:00.000Z",
        "static_fire_date_unix":1536132060
    ]
}

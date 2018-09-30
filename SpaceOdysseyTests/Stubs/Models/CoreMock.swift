//
//  CoreMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension Core {
    static let validCore: JSONValue = [
        "core_serial":"B1049",
        "flight":1,
        "block":5,
        "reused":false,
        "land_success":true,
        "landing_intent":true,
        "landing_type":"ASDS",
        "landing_vehicle":"OCISLY"
    ]
}

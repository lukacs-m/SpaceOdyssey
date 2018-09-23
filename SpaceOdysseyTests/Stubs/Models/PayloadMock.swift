//
//  PayloadMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension Payload {
    static let validPayload: JSONValue = [
        "payload_id":"Telstar 18V",
        "norad_id":[
            43611
        ],
        "reused":false,
        "customers":[
            "Telesat"
        ],
        "nationality":"Canada",
        "manufacturer":"SSL",
        "payload_type":"Satellite",
        "payload_mass_kg":7060,
        "payload_mass_lbs":15564.64,
        "orbit":"GTO",
        "orbit_params": OrbitParams.validOrbitParams
    ]
}

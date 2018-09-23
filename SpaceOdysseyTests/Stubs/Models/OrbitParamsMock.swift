//
//  OrbitParamsMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension OrbitParams {
    static let validOrbitParams: JSONValue = [
        "reference_system":"geocentric",
        "regime":"geostationary",
        "longitude":138,
        "semi_major_axis_km":7226.647,
        "eccentricity":0.0013608,
        "periapsis_km":838.677,
        "apoapsis_km":858.346,
        "inclination_deg":98.8086,
        "period_min":101.897,
        "lifespan_years":15,
        "epoch":"2018-09-07T06:29:40.000Z",
        "mean_motion":14.13180055,
        "raan":322.194,
        "arg_of_pericenter":130.3173,
        "mean_anomaly":328.1487
    ]
}

//
//  RocketMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension Rocket {
    static let validRocket: JSONValue = [
        "rocket_id":"falcon1",
        "rocket_name":"Falcon 1",
        "rocket_type":"Merlin A",
        "first_stage": FirstStage.validFirstStage,
        "second_stage": SecondStage.validSecondStage,
        "fairings": Fairings.validFairings
    ]
}

//
//  FairingsMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension Fairings {
    static let validFairings: JSONValue = [
        "reused":false,
        "recovery_attempt":false,
        "recovered":false,
        "ship":"ship test"
    ]
}

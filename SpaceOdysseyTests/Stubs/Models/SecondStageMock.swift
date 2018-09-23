//
//  SecondStageMock.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey

extension SecondStage {
    static let validSecondStage: JSONValue = [
        "block":5,
        "payloads":[
            Payload.validPayload
        ]
    ]
}

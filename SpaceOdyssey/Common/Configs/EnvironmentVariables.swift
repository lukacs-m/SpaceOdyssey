//
//  EnvironmentVariables.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 22/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct EnvironmentVariables: RawRepresentable {
    var rawValue: String
    static let spaceOdyssey_verbose_level = EnvironmentVariables(rawValue: "spaceOdyssey_verbose_level")
    var value: String {
        let val = ProcessInfo.processInfo.environment[rawValue]
        return val ?? ""
    }
}

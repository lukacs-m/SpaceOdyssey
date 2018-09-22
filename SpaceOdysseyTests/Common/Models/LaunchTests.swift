//
//  LaunchTests.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 22/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
@testable import SpaceOdyssey

//
//extension Launch {
//    static let validLaunch : JSONValue = [
//        "flight_number": 3,
//        "mission_name": "test mission",
//        "mission_id": ["mission ID 1"],
//        "upcoming": false,
//        "launch_year": "",
//        "launch_date_unix": 1234,
//        "launch_date_utc": "",
//        "launch_date_local": "",
//        "is_tentative": true,
//        "launch_success":  true,
//        "details": "test details",
//        "static_fire_date_utc": "test",
//        "static_fire_date_unix": 12
//        ]
//}


//case flightNumber = "flight_number"
//case missionName = "mission_name"
//case missionID = "mission_id"
//case upcoming
//case launchYear = "launch_year"
//case launchDateUnix = "launch_date_unix"
//case launchDateUTC = "launch_date_utc"
//case launchDateLocal = "launch_date_local"
//case isTentative = "is_tentative"
//case tentativeMaxPrecision = "tentative_max_precision"
//case rocket, ships, telemetry, reuse
//case launchSite = "launch_site"
//case launchSuccess = "launch_success"
//case links, details
//case staticFireDateUTC = "static_fire_date_utc"
//case staticFireDateUnix = "static_fire_date_unix"

//let tentativeMaxPrecision: TentativeMaxPrecision?
//let rocket: Rocket?
//let ships: [String]?
//let telemetry: Telemetry?
//let reuse: Reuse?
//let launchSite: LaunchSite?
//let launchSuccess: Bool?
//let links: Links?
//let details, staticFireDateUTC: String?
//let staticFireDateUnix: Int?


//
//
//
//struct PostTestCases {
//    struct MissingFields {
//        static let empty: JSONValue = [:]
//        static let emptyQuestion: JSONValue = [
//            "type": "question"
//        ]
//    }
//
//    struct Valid {
//        static let questionSample: JSONValue = [
//            "postId": 119,
//            "type": "question",
//            "title": "How to write unit tests",
//            "body": "Please teach me!",
//            "answerIds": [
//                120,
//                121
//            ]
//        ]
//
//        static let answer1Sample: JSONValue = [
//            "postId": 120,
//            "type": "answer",
//            "body": "Nobody there? Help!",
//            "parentPostId": 119
//        ]
//
//        static let answer2Sample: JSONValue = [
//            "postId": 121,
//            "type": "answer",
//            "body": "OK, i found the answer by myself. Write them first!",
//            "parentPostId": 119
//        ]
//    }
//}

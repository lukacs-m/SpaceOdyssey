//
//  Launche.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

typealias Launches = [Launch]

struct Launch: Codable {
    let flightNumber: Int?
    let missionName: String
    let missionID: [String]?
    let upcoming: Bool?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: String?
    let rocket: Rocket?
    let ships: [String]?
    let telemetry: Telemetry?
    let reuse: Reuse?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let links: Links?
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case rocket, ships, telemetry, reuse
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
    }
}

// MARK: Convenience initializers and mutators

extension Launch {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Launch.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        flightNumber: Int?? = nil,
        missionName: String,
        missionID: [String]?? = nil,
        upcoming: Bool?? = nil,
        launchYear: String?? = nil,
        launchDateUnix: Int?? = nil,
        launchDateUTC: String?? = nil,
        launchDateLocal: String?? = nil,
        isTentative: Bool?? = nil,
        tentativeMaxPrecision: String?? = nil,
        rocket: Rocket?? = nil,
        ships: [String]?? = nil,
        telemetry: Telemetry?? = nil,
        reuse: Reuse?? = nil,
        launchSite: LaunchSite?? = nil,
        launchSuccess: Bool?? = nil,
        links: Links?? = nil,
        details: String?? = nil,
        staticFireDateUTC: String?? = nil,
        staticFireDateUnix: Int?? = nil
        ) -> Launch {
        return Launch(
            flightNumber: flightNumber ?? self.flightNumber,
            missionName: missionName,
            missionID: missionID ?? self.missionID,
            upcoming: upcoming ?? self.upcoming,
            launchYear: launchYear ?? self.launchYear,
            launchDateUnix: launchDateUnix ?? self.launchDateUnix,
            launchDateUTC: launchDateUTC ?? self.launchDateUTC,
            launchDateLocal: launchDateLocal ?? self.launchDateLocal,
            isTentative: isTentative ?? self.isTentative,
            tentativeMaxPrecision: tentativeMaxPrecision ?? self.tentativeMaxPrecision,
            rocket: rocket ?? self.rocket,
            ships: ships ?? self.ships,
            telemetry: telemetry ?? self.telemetry,
            reuse: reuse ?? self.reuse,
            launchSite: launchSite ?? self.launchSite,
            launchSuccess: launchSuccess ?? self.launchSuccess,
            links: links ?? self.links,
            details: details ?? self.details,
            staticFireDateUTC: staticFireDateUTC ?? self.staticFireDateUTC,
            staticFireDateUnix: staticFireDateUnix ?? self.staticFireDateUnix
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

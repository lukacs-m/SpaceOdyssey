//
//  Core.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Core: Codable {
    let coreSerial: String?
    let flight: Int?
    let block: Int?
    let reused: Bool?
    let landSuccess: Bool?
    let landingIntent: Bool?
    let landingType: LandingType?
    let landingVehicle: LandingVehicle?
    
    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}

extension Core {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Core.self, from: data)
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
        coreSerial: String?? = nil,
        flight: Int?? = nil,
        block: Int?? = nil,
        reused: Bool?? = nil,
        landSuccess: Bool?? = nil,
        landingIntent: Bool?? = nil,
        landingType: LandingType?? = nil,
        landingVehicle: LandingVehicle?? = nil
        ) -> Core {
        return Core(
            coreSerial: coreSerial ?? self.coreSerial,
            flight: flight ?? self.flight,
            block: block ?? self.block,
            reused: reused ?? self.reused,
            landSuccess: landSuccess ?? self.landSuccess,
            landingIntent: landingIntent ?? self.landingIntent,
            landingType: landingType ?? self.landingType,
            landingVehicle: landingVehicle ?? self.landingVehicle
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

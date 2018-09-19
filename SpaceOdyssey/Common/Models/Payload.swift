//
//  Payload.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Payload: Codable {
    let payloadID: String?
    let noradID: [Int]?
    let reused: Bool?
    let customers: [String]?
    let nationality: String?
    let manufacturer: String?
    let payloadType: PayloadType?
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: Orbit?
    let orbitParams: OrbitParams?
    let capSerial: String?
    let massReturnedKg, massReturnedLbs: Double?
    let flightTimeSEC: Int?
    let cargoManifest: String?
    
    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
        case capSerial = "cap_serial"
        case massReturnedKg = "mass_returned_kg"
        case massReturnedLbs = "mass_returned_lbs"
        case flightTimeSEC = "flight_time_sec"
        case cargoManifest = "cargo_manifest"
    }
}

extension Payload {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Payload.self, from: data)
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
        payloadID: String?? = nil,
        noradID: [Int]?? = nil,
        reused: Bool?? = nil,
        customers: [String]?? = nil,
        nationality: String?? = nil,
        manufacturer: String?? = nil,
        payloadType: PayloadType?? = nil,
        payloadMassKg: Double?? = nil,
        payloadMassLbs: Double?? = nil,
        orbit: Orbit?? = nil,
        orbitParams: OrbitParams?? = nil,
        capSerial: String?? = nil,
        massReturnedKg: Double?? = nil,
        massReturnedLbs: Double?? = nil,
        flightTimeSEC: Int?? = nil,
        cargoManifest: String?? = nil
        ) -> Payload {
        return Payload(
            payloadID: payloadID ?? self.payloadID,
            noradID: noradID ?? self.noradID,
            reused: reused ?? self.reused,
            customers: customers ?? self.customers,
            nationality: nationality ?? self.nationality,
            manufacturer: manufacturer ?? self.manufacturer,
            payloadType: payloadType ?? self.payloadType,
            payloadMassKg: payloadMassKg ?? self.payloadMassKg,
            payloadMassLbs: payloadMassLbs ?? self.payloadMassLbs,
            orbit: orbit ?? self.orbit,
            orbitParams: orbitParams ?? self.orbitParams,
            capSerial: capSerial ?? self.capSerial,
            massReturnedKg: massReturnedKg ?? self.massReturnedKg,
            massReturnedLbs: massReturnedLbs ?? self.massReturnedLbs,
            flightTimeSEC: flightTimeSEC ?? self.flightTimeSEC,
            cargoManifest: cargoManifest ?? self.cargoManifest
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

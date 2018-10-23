//
//  Roquet.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Rocket: Codable {
    let rocketID: String?
    let rocketName: String?
    let rocketType: String?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let fairings: Fairings?
    
    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

extension Rocket {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rocket.self, from: data)
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
        rocketID: String?? = nil,
        rocketName: String?? = nil,
        rocketType: String?? = nil,
        firstStage: FirstStage?? = nil,
        secondStage: SecondStage?? = nil,
        fairings: Fairings?? = nil
        ) -> Rocket {
        return Rocket(
            rocketID: rocketID ?? self.rocketID,
            rocketName: rocketName ?? self.rocketName,
            rocketType: rocketType ?? self.rocketType,
            firstStage: firstStage ?? self.firstStage,
            secondStage: secondStage ?? self.secondStage,
            fairings: fairings ?? self.fairings
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

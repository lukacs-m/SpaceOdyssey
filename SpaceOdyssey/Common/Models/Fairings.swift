//
//  Fairings.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ship: String?
    
    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ship
    }
}

extension Fairings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fairings.self, from: data)
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
        reused: Bool?? = nil,
        recoveryAttempt: Bool?? = nil,
        recovered: Bool?? = nil,
        ship: String?? = nil
        ) -> Fairings {
        return Fairings(
            reused: reused ?? self.reused,
            recoveryAttempt: recoveryAttempt ?? self.recoveryAttempt,
            recovered: recovered ?? self.recovered,
            ship: ship ?? self.ship
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

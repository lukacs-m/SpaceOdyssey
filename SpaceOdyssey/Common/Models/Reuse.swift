//
//  Reuse.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Reuse: Codable {
    let core, sideCore1, sideCore2, fairings: Bool?
    let capsule: Bool?
    
    enum CodingKeys: String, CodingKey {
        case core
        case sideCore1 = "side_core1"
        case sideCore2 = "side_core2"
        case fairings, capsule
    }
}

extension Reuse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Reuse.self, from: data)
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
        core: Bool?? = nil,
        sideCore1: Bool?? = nil,
        sideCore2: Bool?? = nil,
        fairings: Bool?? = nil,
        capsule: Bool?? = nil
        ) -> Reuse {
        return Reuse(
            core: core ?? self.core,
            sideCore1: sideCore1 ?? self.sideCore1,
            sideCore2: sideCore2 ?? self.sideCore2,
            fairings: fairings ?? self.fairings,
            capsule: capsule ?? self.capsule
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
//  SecondStage.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct SecondStage: Codable {
    let block: Int?
    let payloads: [Payload]?
}

extension SecondStage {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SecondStage.self, from: data)
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
        block: Int?? = nil,
        payloads: [Payload]?? = nil
        ) -> SecondStage {
        return SecondStage(
            block: block ?? self.block,
            payloads: payloads ?? self.payloads
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
//  HomeApi.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import Moya

enum SpaceXApi {
    case launches()
}

extension SpaceXApi: TargetType {

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.spacexdata.com/v3") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .launches:
            return "/launches/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .launches:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .launches:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .launches:
            return .requestPlain
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

//
//  APIManager.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import PromiseKit
import Moya

protocol GeneralAPI {
    static func callApi<T: TargetType, U: Decodable>(_ target: T, dataReturnType: U.Type, test: Bool) -> Promise<U>
}

struct APIManager: GeneralAPI {
    
    static func callApi<T: TargetType, U: Decodable>(_ target: T, dataReturnType: U.Type, test: Bool = false) -> Promise<U> {
        
        var debugMode  = false
        
        if EnvironmentVariables.spaceOdyssey_verbose_level.value == "verbose" {
            debugMode = true
        }

        let provider = test ? (MoyaProvider<T>(stubClosure: MoyaProvider.immediatelyStub)) :
            (debugMode ? MoyaProvider<T>(plugins: [NetworkLoggerPlugin(verbose: true)]) : MoyaProvider<T>())
        
        return Promise { seal in
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(U.self, from: response.data)
                        seal.fulfill(results)
                    } catch {
                        seal.reject(error)
                    }
                case let .failure(error):
                    seal.reject(error)
                }
            }
        }
    }
}

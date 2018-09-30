//
//  LaunchTests.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 22/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey
import Quick
import Nimble

class LaunchTests: QuickSpec {
    
    override func spec() {
        describe("Launch Test") {
            var launch: Launch!
            var validLaunch: JSONValue!
            
            beforeEach {
                validLaunch = Launch.validLaunch
            }
            
            it("should be a valide launch") {
                launch = try! Launch(validLaunch.jsonString())
                
                expect(launch).to(beAKindOf(Launch.self))
                expect(launch.missionName) == "Telstar 18V"
                expect(launch.flightNumber) == 68
                expect(launch.upcoming) == false
            }
        }
    }
}

//
//  HomeViewControllerUITests.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 30/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

@testable import SpaceOdyssey
import Quick
import Nimble
import Nimble_Snapshots

class HomeViewControllerUITests: QuickSpec {
    
    override func spec() {
        
        describe("HomeViewControllerUI tests") {
            
            // MARK: Subject under test
            
            var sut: HomeViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupHomeViewController() {
                sut = HomeViewController()
            }
            
            beforeSuite {
                LaunchesNetworkInjector.networkManager = LaunchesNetworkManagerMock()
            }
            
            afterSuite {
                LaunchesNetworkInjector.networkManager = LaunchesNetworkManager()
            }
            
            beforeEach {
                window = UIWindow(frame: UIScreen.main.bounds)
                setupHomeViewController()
                window.addSubview(sut.view)
                _ = sut.view
            }
            
            afterEach {
                sut = nil
                window = nil
            }

            //MARK: - Test
            
            context("When home view is loaded") {
                it("Should have four launches displayed in home page collection view") {
                    _ = sut.view

                    expect(sut.view).toEventually(haveValidSnapshot(), timeout: 1)

                }
            }
        }
    }
}


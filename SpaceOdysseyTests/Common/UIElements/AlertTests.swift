//
//  AlertTests.swift
//  SpaceOdysseyTests
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Quick
import Nimble
@testable import SpaceOdyssey

class AlertTests: QuickSpec {
    
    override func spec() {
        
        describe("Alert tests") {
            
            // MARK: Subject under test
            
            var viewController: UIViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupViewController() {
                viewController = UIViewController()
            }
            
            beforeEach {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupViewController()
            }
            
            func loadview() {
                window.addSubview(viewController.view)
            }
            
            afterEach {
                window = nil
            }
            
            
            //MARK: - Test
            
            context("When view is loaded") {
                it("Should present an alert") {
                    loadview()
                    Alert.showUnableToRetrieveDataAlert(on: viewController)
                    expect(viewController.presentedViewController).toEventuallyNot(beNil())
                    expect(viewController.presentedViewController).toEventually(beAKindOf(UIAlertController.self))
                    expect(viewController.presentedViewController?.title) == "Unable to Retrieve Space X Data"
                    guard let vc = viewController.presentedViewController, let alert = vc as? UIAlertController else { return }
                    expect(alert.message) == "Network Error. Please pull the screen to refresh"
                }
            }
        }
    }
}

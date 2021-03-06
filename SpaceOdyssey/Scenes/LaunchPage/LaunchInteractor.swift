//
//  LaunchInteractor.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 23/09/2018.
//  Copyright (c) 2018 martin. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LaunchBusinessLogic {
  func getLaunch(request: LaunchPage.GetLaunch.Request)
}

protocol LaunchDataStore {
   var launch: Launch! { get set }
}

final class LaunchInteractor: LaunchBusinessLogic, LaunchDataStore {
  var presenter: LaunchPresentationLogic?
  var launch: Launch!
  
  // MARK: Launch to display
  
  /// Set up the launch to display
  ///
  /// - Parameter request: The request from view controller to fetch the current launch to display
  func getLaunch(request: LaunchPage.GetLaunch.Request) {
    
    let response = LaunchPage.GetLaunch.Response(launch: launch)
    presenter?.presentLaunch(response: response)
  }
}

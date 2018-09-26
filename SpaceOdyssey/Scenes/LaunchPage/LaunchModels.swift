//
//  LaunchModels.swift
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

enum LaunchPage {
  // MARK: Use cases
  
  enum GetLaunch {
    struct Request {
    }
    
    struct Response {
        var launch: Launch
    }
    
    struct ViewModel {
        struct DisplayedLaunch {
            var title: String
            var date: String
            var description: String
            var success: Bool
            var videoUrl: String?
            var imgUrls: [String]?
        }
        var displayedLaunch: DisplayedLaunch
    }
  }
}

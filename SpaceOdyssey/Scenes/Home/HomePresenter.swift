//
//  HomePresenter.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright (c) 2018 martin. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic {
  func presentFetchHomeData(response: Home.FetchHomeLaunches.Response)
}

final class HomePresenter: HomePresentationLogic {
  weak var viewController: HomeDisplayLogic?
    
  // MARK: Format the data to be display on home page
  
  func presentFetchHomeData(response: Home.FetchHomeLaunches.Response) {
    var displayedLaunches: [Home.FetchHomeLaunches.ViewModel.DisplayedLaunch] = []
    
    if let launches = response.launches {
        for launch in launches {
            let date = (launch.launchDateUTC ?? "").fromUTCToLocalDateTime()
            let name = launch.missionName
            let imgUrl = launch.links?.missionPatch
            
            let displayedlaunch = Home.FetchHomeLaunches.ViewModel.DisplayedLaunch(name: name, date: date, imgUrl: imgUrl)
            displayedLaunches.append(displayedlaunch)
        }
    }
    
    let viewModel = Home.FetchHomeLaunches.ViewModel(displayedLaunches: displayedLaunches, error: response.error)
    viewController?.displayHomeLaunches(viewModel: viewModel)
  }
}

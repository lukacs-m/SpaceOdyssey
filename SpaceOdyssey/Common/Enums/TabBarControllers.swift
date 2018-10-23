//
//  TabBarControllers.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 22/10/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import UIKit
import SwiftIcons

/// Enum containing the tabbar controllers
///
/// - home: Main TabBar page
/// - chart: User charts
/// - account: User account controller
enum TabBarControllers: String, CaseIterable {
    case launches
    case rockets
    case roadster
    case about
    
    /// Return the image associated with the current value of TabBarControllers
    ///
    /// - Parameter selected: Boolean taht determinates the state of image
    /// - Returns: The  image to display in the tabbar
    func getImage(selected: Bool = false) -> UIImage {
        switch self {
        case .launches:
            return UIImage.init(icon: .fontAwesomeSolid(.broom), size: CGSize(width: 22, height: 22), textColor: selected ? Style.Color.MainGray : .lightGray)
        case .rockets:
            return UIImage.init(icon: .fontAwesomeSolid(.rocket), size: CGSize(width: 22, height: 22), textColor: selected ? Style.Color.MainGray : .lightGray)
        case .roadster:
            return UIImage.init(icon: .fontAwesomeSolid(.car), size: CGSize(width: 22, height: 22), textColor: selected ? Style.Color.MainGray : .lightGray)
        case .about:
            return UIImage.init(icon: .fontAwesomeSolid(.user), size: CGSize(width: 22, height: 22), textColor: selected ? Style.Color.MainGray : .lightGray)
            
        }
    }
    
    /// Return a viewController associated with the current value of TabBarControllers
    ///
    /// - Returns: ViewController to display in tabbar
    func getViewController() -> UIViewController {
        switch self {
        case .launches:
            return HomeViewController()
        case .rockets:
            return UIViewController()
        case .roadster:
            return  UIViewController()
        case .about:
            return  UIViewController()
            
        }
    }
    
    func getName() -> String {
        switch self {
        case .launches:
            return "Launches".uppercased()
        case .rockets:
            return "Rockets".uppercased()
        case .roadster:
            return "Rodster".uppercased()
        case .about:
            return "About".uppercased()
        }
    }
}

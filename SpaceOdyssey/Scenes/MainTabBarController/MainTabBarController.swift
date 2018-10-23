//
//  MainTabBarController.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 22/10/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import UIKit

/// Main TabBar controller
class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    /// Sets up the tabbar controller view and controllers
    private func setUpUI() {
        for controller in TabBarControllers.allCases {
            addController(controller.getViewController(), name: controller.getName(),
                          image: controller.getImage(),
                          selectedImage: controller.getImage(selected: true),
                          insideNavController: true)
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Style.Color.MainGray], for: .selected)
    }
}

extension MainTabBarViewController {
    
    ///
    /// add controller to tabbar
    /// - parameter controller: controller to add
    /// - parameter name: name to display in tab bar
    /// - parameter image: image to display
    /// - parameter selectedImage: image to display when selected
    /// - parameter insideNavController: add controller inside navcontroller
    ///
    private func addController(_ controller: UIViewController, name: String, image: UIImage?, selectedImage: UIImage?, insideNavController: Bool = true, tag: Int = 0) {
        var newController = controller
        
        // create navbar if need
        if insideNavController {
            let nav = UINavigationController(rootViewController: controller)
            newController = nav
        }
        
        self.viewControllers == nil ? self.viewControllers = [newController] : self.viewControllers?.append(newController)
        
        //create tabar item
        newController.tabBarItem = UITabBarItem(
            title: name,
            image: image?.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal)
        )
        
        newController.tabBarItem.tag = tag
    }
}

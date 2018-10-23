//
//  UIImage+Extensions.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 22/10/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Create a UIImage with a specific color
    ///
    /// - Parameter color: The color to set in the image
    /// - Returns: UIImage filled with the color
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}


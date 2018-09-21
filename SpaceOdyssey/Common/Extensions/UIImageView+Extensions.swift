//
//  UIImageView+Extensions.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 21/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        let image = UIImage(named: "spaceX")
        self.kf.setImage(with: ImageResource(downloadURL: imageURL), placeholder: image)
    }
}


//
//  HomeCollectionViewCell.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 20/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imgMain: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(item: Home.FetchHomeLaunches.ViewModel.DisplayedLaunch) {
        lblTitle.text = item.name ?? ""
        lblDate.text = item.date
        imgMain.download(image: item.imgUrl ?? "")
    }
}


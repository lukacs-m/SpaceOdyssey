//
//  HomeCollectionViewCell.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 20/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import UIKit
import SkeletonView

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imgMain: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        isSkeletonable = true
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
    func update(item: Home.FetchHomeLaunches.ViewModel.DisplayedLaunch) {
        lblTitle.text = item.name ?? ""
        lblDate.text = item.date
        imgMain.download(image: item.imgUrl ?? "")
    }
}


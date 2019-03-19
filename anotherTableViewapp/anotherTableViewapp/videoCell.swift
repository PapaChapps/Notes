//
//  videoCell.swift
//  anotherTableViewapp
//
//  Created by Makay Chapple on 12/19/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class videoCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    func setVideo(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
}

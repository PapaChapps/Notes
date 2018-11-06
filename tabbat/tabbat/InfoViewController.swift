//
//  InfoViewController.swift
//  tabbat
//
//  Created by Makay Chapple on 10/5/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!

    
    func setInfo(with info: String) {
        self.loadViewIfNeeded()
        self.infoLabel.text = info
    }
}

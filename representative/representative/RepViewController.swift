//
//  RepViewController.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit

class RepViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        updateView()
    }

    var representative: Representative? {
        return RepresentativeController.sharedController.representatives.first
}
    func updateView() {
        if let rep = representative {
            nameLabel.text = rep.name
            addressLabel.text = rep.address
            phoneNumberLabel.text = rep.phoneNumber
        } else {
            nameLabel.text = "search for a rep"
            addressLabel.text = "search address"
            phoneNumberLabel.text = "search for a number"
        }
}

}

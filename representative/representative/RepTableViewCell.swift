//
//  RepTableViewCell.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    func updateCell(rep: Representative) {
        nameLabel.text = rep.name
        addressLabel.text = rep.address
        phoneNumberLabel.text = rep.phoneNumber
    }

}

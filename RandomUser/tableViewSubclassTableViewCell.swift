//
//  tableViewSubclassTableViewCell.swift
//  RandomUser
//
//  Created by Makay Chapple on 12/14/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class tableViewSubclassTableViewCell: UITableViewCell {
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private func resetForm() {
        infoImage.image = nil
        nameLabel.text = ""
    }
private func update( _ info:Info?) {
    nameLabel.text = info?.firstName
}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

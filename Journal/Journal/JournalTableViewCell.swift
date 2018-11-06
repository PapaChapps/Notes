//
//  JournalTableViewCell.swift
//  Journal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    var journal: Journal? {
        didSet {
            guard let journal = journal else {return}
            updateCell(with: journal)
        }
    }
    func updateCell(with journal: Journal) {
        Title.text = journal.name
        content.text = journal.entry
    }
}

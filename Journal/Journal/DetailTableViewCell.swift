//
//  DetailTableViewCell.swift
//  Journal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewController{
    
    @IBOutlet weak var entryNameTextfield: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedEntryNameTextfield = entryNameTextfield.text, let unwrappedContentTextView = contentTextView.text {
            let journal: Journal? = Journal.init(name: unwrappedEntryNameTextfield, entry: unwrappedContentTextView)
        }
        // let journal = Journal.init(name: entryNameTextfield.text, entry: contentTextView.text)
    }
    var journal: Journal?
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        journal = Journal(name: entryNameTextfield.text ?? "", entry: contentTextView.text)
        performSegue(withIdentifier: "DetailedUnwind", sender: nil)
    }
}

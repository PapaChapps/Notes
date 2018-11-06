//
//  DetailViewController.swift
//  newJournal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let entry = entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
        }
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let unwrappedTitleTextField = titleTextField.text, let unwrappedBodyTextView = bodyTextView.text {
            
            EntryController.sharedInstance.addEntry(title: unwrappedTitleTextField, body: unwrappedBodyTextView)
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
}

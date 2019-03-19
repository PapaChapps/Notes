//
//  ViewController.swift
//  rememberList
//
//  Created by Makay Chapple on 1/8/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [String] = []
    
    @IBAction func addNoteButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title:  "New Note",
                                      message: "Add a new note",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField = alert.textFields?.first,
                                            let noteToSave = textField.text else {
                                                return
                                                
                                        }
                                        
                                        
                                        
                                        
                                        self.notes.append(noteToSave )
                                        self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField()
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        loadStores()
        
        present(alert, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "notes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "Cell",
                                              for: indexPath)
            cell.textLabel?.text = notes[indexPath.row]
            return cell
    }
}

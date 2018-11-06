//
//  EntryTableViewController.swift
//  newJournal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        let titleOfEntry = entry.title
        
        cell.textLabel?.text = titleOfEntry

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let IndexPath = tableView.indexPathForSelectedRow, let viewController = segue.destination as? DetailViewController else {return}
        
        if segue.identifier == "" {
            viewController.entry = EntryController.sharedInstance.entries[IndexPath.row]
            
        }
    }
   

}

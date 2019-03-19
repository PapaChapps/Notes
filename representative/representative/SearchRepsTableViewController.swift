//
//  SearchRepsTableViewController.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
import CoreData

class SearchRepsTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!    
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
      searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        RepresentativeController.sharedController.searchForReps(zipcode: searchText) { (reps) in DispatchQueue.main.async {
            if let reps = reps {
                self.representatives = reps
            }
            self.tableView.reloadData()
            }
            
        }
    }
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repCell",
                                                 for: indexPath) as? RepTableViewCell else { return UITableViewCell() }

        let rep = representatives[indexPath.row]
        
        cell.updateCell(rep: rep)
    

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let rep = representatives[indexPath.row]
        RepresentativeController.sharedController.saveRep(rep: rep)
        navigationController?.popViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
    

   
}

//
//  ViewController.swift
//  Bios
//
//  Created by Makay Chapple on 10/31/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var bios = [Bio]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bios.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bioCell", for: indexPath) as? BioTableViewCell else{
            return UITableViewCell() }
        cell.bio = bios[indexPath.row]
        return cell
    }
    @IBAction func unwind(segue: UIStoryboardSegue){
        if let source = segue.source as? DetailTableViewController, let bio = source.bio {
            bios.append(bio)
            tableView.reloadData()
            
        }
    }
    
    
}

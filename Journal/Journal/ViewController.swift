//
//  ViewController.swift
//  Journal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var journal = [Journal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? JournalTableViewCell else {
            return UITableViewCell() }
        cell.journal = journal[indexPath.row]
        return cell
        }
    @IBAction func unwind(segue: UIStoryboardSegue){
        if let source = segue.source as? DetailTableViewCell, let journal = source.journal {
            self.journal.append(journal)
            tableView.reloadData()
        }
    }


}


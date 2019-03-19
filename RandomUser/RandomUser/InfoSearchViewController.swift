//
//  InfoSearchViewController.swift
//  RandomUser
//
//  Created by Makay Chapple on 12/12/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import Foundation
import UIKit

class InfoSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    var info: Info? {
        didSet {
            DispatchQueue.main.sync {
                update(info)
            }
        }
    }
    // outlets
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    

    
    
    // methodes
    
    private func resetForm() {
        DispatchQueue.main.sync {
            searchBar.text = ""
            
            
        }
    }
    private func update(_ info: Info?) {
        if let info = info {
            
            
            
            if let imageURLString = info.imageURLString {
                NetworkController.fetchInfoImage(urlString: imageURLString) {(data) in
                    if let data = data {
                        let image = UIImage(data:data)
                        
                        DispatchQueue.main.sync {
                            
                        }
                    }
                }
            }
            
        }
    }
}

extension InfoSearchTableViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {
            print(":(")
            return
        }
        InfoController.getInfo(searchTerm: searchTerm) { (info) in
            guard let info = info else {
                self.resetForm()
                DispatchQueue.main.sync {
                    let alertController = UIAlertController(title: "not found", message: "the name specified could not be found", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                    self.present(alertController,animated: true, completion: nil)
                    
                }
                return
            }
            self.info = info
        }
    }
}

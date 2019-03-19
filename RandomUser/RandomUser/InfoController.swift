//
//  InfoController.swift
//  RandomUser
//
//  Created by Makay Chapple on 12/12/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import Foundation

class InfoController {
    static let baseURL = "https://randomuser.me/api/"
    
    static func getInfo(searchTerm: String, completion: @escaping (Info?) -> Void) {
        let searchURLString = baseURL + searchTerm.lowercased()
        _ = NetworkController.fetchInfo(urlString: searchURLString, completion: { (Info) in
            completion(Info)
        })
    }
    static func imitateSend( _ info: Info, completion: (Bool) -> Void) {
        
    }
    static func populateInfo(searchBar: InfoSearchTableViewController) {
        
    }
        
}

//
//  NetworkController.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation

class networkController {
    
    static func preformNetworkRequest(for url: URL, completion: ((Data?, Error?) -> Void)? = nil)
    {
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let completion = completion {
                completion(data, error)
            }
        }
        dataTask.resume()
    }
}

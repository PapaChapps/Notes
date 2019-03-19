//
//  NetworkController.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/15/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation

class networkController {
    
    static func preformNetworkRequest(for url: URL, completion: @escaping (Data?) -> Void)
    {
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            completion(data)
        }
        dataTask.resume()
    }
}

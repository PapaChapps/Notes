//
//  NewtworkController.swift
//  FoodPantry
//
//  Created by Makay Chapple on 2/13/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func preformNetworkRequest(for url: URL, completion: @escaping (Data?) -> Void)
        
    {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
}

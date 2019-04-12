//
//  NewtworkController.swift
//  FoodPantry
//
//  Created by Makay Chapple on 2/13/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation

class NetworkController {
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    
    
     func performNetworkRequest(for url: URL, completion: @escaping (Data?) -> Void)
    {
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
        dataTask?.resume()
        
        
        
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print(error)
//            }
//            if data != nil {
//                completion(data)
//            }
//        }.resume()
    }
}

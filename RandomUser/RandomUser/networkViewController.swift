//
//  NetworkController.swift
//  Pokedex
//
//  Created by Jeff Norton on 12/6/18.
//  Copyright © 2018 Jeff Norton. All rights reserved.
//

import Foundation

class NetworkController {
    
    
    // MARK: - Methods
 
    
    static func fetchInfo(urlString: String, completion: @escaping (Info?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Could not access the Info URL.")
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                print("Error: \(error)")
                completion(nil)
            }
            
            if let response = response as? HTTPURLResponse{
                print("Response: \(response)")
                print("Response status code: \(response.statusCode)")
                
                if response.statusCode != 200 {
                    completion(nil)
                }
            }
            
            if let data = data {
                
                do {
                    let info = try jsonDecoder.decode(Info.self, from: data)
                    completion(info)
                    
                } catch(let error) {
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
        
        dataTask.resume()
    }
    
    static func fetchInfoImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Could not access the Info image URL.")
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        
        dataTask.resume()
    }
}

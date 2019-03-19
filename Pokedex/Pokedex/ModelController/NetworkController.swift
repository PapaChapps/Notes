//
//  NetworkController.swift
//  Pokedex
//
//  Created by Jeff Norton on 12/6/18.
//  Copyright © 2018 Jeff Norton. All rights reserved.
//

import Foundation

class NetworkController {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func fetchPokemon(urlString: String, completion: @escaping (Pokemon?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Could not access the Pokemon URL.")
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
                    let pokemon = try jsonDecoder.decode(Pokemon.self, from: data)
                    completion(pokemon)
                    
                } catch(let error) {
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
        
        dataTask.resume()
    }
    
    static func fetchPokemonImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Could not access the Pokemon image URL.")
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        
        dataTask.resume()
    }
}

//
//  PokemonController.swift
//  Pokedex
//
//  Created by Jeff Norton on 12/6/18.
//  Copyright © 2018 Jeff Norton. All rights reserved.
//

import Foundation

class PokemonController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func getPokemon(searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        let searchURLString = baseURL + searchTerm.lowercased()
        
        _ = NetworkController.fetchPokemon(urlString: searchURLString, completion: { (pokemon) in
            completion(pokemon)
        })
    }
    static func imitateSend( _ pokemon: Pokemon, completion: (Bool) -> Void) {
        
        }
}

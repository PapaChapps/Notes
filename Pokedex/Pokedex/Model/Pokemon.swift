//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jeff Norton on 12/6/18.
//  Copyright © 2018 Jeff Norton. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    let id: Int
    let imageURLString: String?
    let name: String
    let sprites: [String: String?]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
    }
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        
        self.sprites = try valueContainer.decode([String: String?].self, forKey: CodingKeys.sprites)
        self.imageURLString = sprites["front_default"] ?? nil
    }
    // MARK: - Encoding
    
    func encode(to encoder: Encoder) throws {
        var baseContianer = encoder.container(keyedBy: CodingKeys.self)
        try baseContianer.encode(self.id, forKey: CodingKeys.id)
        try baseContianer.encode(self.name, forKey: CodingKeys.name)
        try baseContianer.encode(self.sprites, forKey: CodingKeys.sprites)
    }
}

struct PokemonContainer : Codable {
    let pokemon: [Pokemon]
    enum CodingKeys: String, CodingKey {
        case pokemon
        
    }
    init(from decoder: Decoder) throws {
        let baseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemon = try baseContainer.decode([Pokemon].self, forKey: CodingKeys.pokemon)
    }
    func encode(to encoder: Encoder) throws {
        var baseContainer = encoder.container(keyedBy: CodingKeys.self)
        try baseContainer.encode(self.pokemon, forKey: CodingKeys.pokemon)
    }
}

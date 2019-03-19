//
//  info.swift
//  RandomUser
//
//  Created by Makay Chapple on 12/12/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import Foundation

struct Info: Codable{
    var firstName: String
    var lastName: String
    var imageURL: String
    var info: String
    var imageURLString: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case imageURL
        case info
        
}
    // MARK: - Initializer Decoder
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.firstName = try valueContainer.decode(String.self, forKey: CodingKeys.firstName)
        self.lastName = try valueContainer.decode(String.self, forKey: CodingKeys.lastName)
        
        self.imageURL = try valueContainer.decode(String.self, forKey: CodingKeys.imageURL)
        self.info = try valueContainer.decode(String.self, forKey: CodingKeys.info)
        self.imageURLString = imageURL
        
    }
    // MARK: - Encoding
    
    func encode(to encoder: Encoder) throws {
        var baseContainer = encoder.container(keyedBy: CodingKeys.self)
        try baseContainer.encode(self.firstName, forKey: CodingKeys.firstName)
        try baseContainer.encode(self.lastName, forKey: CodingKeys.lastName)
        try baseContainer.encode(self.imageURL, forKey: CodingKeys.imageURL)
        try baseContainer.encode(self.info, forKey: CodingKeys.info)
        
    }
}

struct InfoContainer: Codable {
    let info: [Info]
    enum CodingKeys: String, CodingKey {
        case info
    }
    init(from decoder: Decoder) throws {
        let baseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try baseContainer.decode([Info].self, forKey: CodingKeys.info)
    }
    func encode(to encoder: Encoder) throws {
        var baseContainer = encoder.container(keyedBy: CodingKeys.self)
        try baseContainer.encode(self.info, forKey: CodingKeys.info)
    }
}

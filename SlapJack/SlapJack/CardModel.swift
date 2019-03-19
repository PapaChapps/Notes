//
//  DeckModel.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/15/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

extension Card {
    
   
   
    convenience init?(dictionary:
    
        Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        
        guard let value = dictionary ["value"] as? String,
            let imageURL = dictionary ["image"] as? String,
            let suit = dictionary ["suit"] as? String else { return nil }
        
        self.init(context: context)
        
        self.value = value
        self.imageURL = imageURL
        self.suit = suit
        self.wasSlapped = false
        
    }
    
    
}



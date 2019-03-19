//
//  DeckModel.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/16/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

extension Deck {
    
    
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        
        guard let deck_id = dictionary ["deck_id"] as? String,
            let remainingCards = dictionary ["remaining"] as? Int64 else { return nil }
        
        self.init(context: context)
        
        self.deck_id = deck_id
        self.remainingCards = remainingCards
        
    }
}

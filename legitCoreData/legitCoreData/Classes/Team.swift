//
//  Team.swift
//  legitCoreData
//
//  Created by Makay Chapple on 1/11/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData



// class team created in datamodel
extension Team {
    convenience init?(name: String, player: String, numberOfGoals: Double, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context:context)
        self.teamName = name
        self.favoritePlayer = player
        self.goalsScored = numberOfGoals
        self.dateCreated = Date()
    }
    
}

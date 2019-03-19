//
//  Representative.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

extension Representative {
    convenience init?(dictionary:
        Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        
        guard let name = dictionary ["name"] as? String,
            let phone = dictionary ["phone"] as? String,
            let address = dictionary ["office"] as? String else { return nil }
        
        
        
        self.init(context: context)
        
        self.name = name
        self.phoneNumber = phone
        self.address = address
    }
}

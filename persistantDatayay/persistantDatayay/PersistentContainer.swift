//
//  PersistentContainer.swift
//  persistantDatayay
//
//  Created by Makay Chapple on 1/9/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

struct Container {

let container = NSPersistentContainer(name: "Model")
    func loadStores(){
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in self.container})
    
        }
    
}





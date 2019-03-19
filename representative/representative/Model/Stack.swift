//
//  Stack.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//
// COMPUTED PROPERTY

import Foundation
import CoreData

enum Stack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error {
                fatalError("unresolved error\(error)")
            }
            
        }
        
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}

//
//  Stack.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/16/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    static let context: NSManagedObjectContext = {
        return Stack.persistentContainer.viewContext
        
    }()
    static var persistentContainer: NSPersistentContainer = {
        
        
        let container = NSPersistentContainer(name: "SlapJack")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

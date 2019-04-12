//
//  Stack.swift
//  FoodPantryMKII
//
//  Created by Makay Chapple on 2/13/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData


class Stack {
    static let sharedController = Stack()
    
    static let context: NSManagedObjectContext = {
        return Stack.persistentContainer.viewContext
        
    }()
    static var persistentContainer: NSPersistentContainer = {
        
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
//        let savedRecipe: Data? = "this is a saved recipe".data(using: .utf8)
//        savedRecipe?.write(to: <#T##URL#>)
//        let context = Stack.persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
    }
}

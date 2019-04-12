//
//  MealController.swift
//  FoodPantry
//
//  Created by Makay Chapple on 2/13/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

class RecipeController {
    
    static let sharedController = RecipeController()
    
    let networkController = NetworkController()
    
    func getRecipes(searchTerm: String, completion: @escaping (DecodedRecipes?) -> Void) {
        var baseURL = "https://www.food2fork.com/api/search?key=92cc3c024efc610776620a8961f0c0e3&q=\(searchTerm.lowercased())"
        
        baseURL = "https://www.food2fork.com/api/search?key=92cc3c024efc610776620a8961f0c0e3&q=shredded%20chicken"
        
        let searchURLString = baseURL
        guard let url = URL(string: searchURLString) else {
            return
        }
        
        networkController.performNetworkRequest(for: url, completion: { (data) in
            
            if let unwrappedData = data {
                do {
                    let decoder = JSONDecoder()
                    
                    let recipes = try decoder.decode(DecodedRecipes.self, from: unwrappedData)
                    print(recipes)
                    completion(recipes)
                } catch {
                    print(error)
                }
            }
        })
        
        return
    }
    //    private func saveToPersistanceStorage() {
    //        do{
    //            try Stack.context.save()
    //        } catch {
    //            print("REEEEEE")
    //        }
    //    }
    //
    //
    //
    //
}





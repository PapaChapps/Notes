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
    
    
    
    func getRecipes(searchTerm: String, completion: @escaping ([TempRecipe]?) -> Void) {
        let baseURL = "https://www.food2fork.com/api/search?key=92cc3c024efc610776620a8961f0c0e3&q=\(searchTerm.lowercased())"
        
        
        let searchURLString = baseURL
        guard let url = URL(string: searchURLString) else {
            return
        }
        
        NetworkController.preformNetworkRequest(for: url, completion: { (data) in
           
            if let data = data {
            
            do {
                let decoder = JSONDecoder()
                let recipes = try decoder.decode([TempRecipe].self, from: data)
                print(recipes)
                completion(nil)
                
                
            } catch {
                print(error)
            }
            }
        })
        
        return
    }
    

    
    private func saveToPersistanceStorage() {
        do{
            try Stack.context.save()
        } catch {
            print("REEEEEE")
        }
    }
    
    
    
    
}





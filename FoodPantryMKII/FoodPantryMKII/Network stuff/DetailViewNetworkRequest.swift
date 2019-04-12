//
//  NetworkProtocol.swift
//  FoodPantry
//
//  Created by Makay Chapple on 3/5/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//
import UIKit
import Foundation

class NetworkDetailedRecipeService: DetailRecipeService {
    func getData(tempRecipe: TempRecipe?, completion: @escaping (SingleRecipeContainer?) -> Void) {
        let detailedURL = URL(string: "https://www.food2fork.com/api/get")
        if let recipe = tempRecipe {
            let query: [String: String] = ["key": "92cc3c024efc610776620a8961f0c0e3",
                                           "rId": recipe.recipeID]
            let url = detailedURL!.withQueries(query)!
            print(url)
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data,
                    let string = String(data: data, encoding: .utf8){
                    print("My string: \(string)")
                    
                }
                if let unwrappedData = data {
                    do {
                        let decoder = JSONDecoder()
                        
                        let recipe = try decoder.decode(SingleRecipeContainer.self, from: unwrappedData)
                        print(recipe)
                        completion(recipe)
                        
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }
}

//class StubDetailRecipeService: DetailRecipeService {
//    func getData(tempRecipe: TempRecipe?, completion: @escaping (DetailedRecipes?) -> Void) {
//        let recipe = DetailedRecipes(publisher: "Closet Cooking", ingrediants: ["1/2 pound ground beef", "6 strips bacon, cut into 1 inch pieces", "1 small onion, diced", "1 clove garlic, chopped", "4 ounces cream cheese, room temperature", "1/2 cup sour cream", "1/4 cup mayonnaise", "1/2 cup mozzarella, shredded", "1/2 cup cheddar cheese, shredded", "1 tablespoon worcestershire sauce", "2 tablespoon ketchup\n"], title: "Bacon Double Cheese Burger Dip", image: "http://static.food2fork.com/Bacon2BDouble2BCheese2BBurger2BDip2B5002B3557cdaa745d.jpg")
//        completion(recipe)
//    }
//
//
//}

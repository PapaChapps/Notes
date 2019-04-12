//
//  DetailedRecipeViewController.swift
//  FoodPantryMKII
//
//  Created by Makay Chapple on 3/21/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
protocol DetailRecipeService {
    func getData(tempRecipe: TempRecipe?, completion: @escaping (SingleRecipeContainer?) -> Void)
}
class DetailedRecipeTableViewController: UITableViewController {
    var service: DetailRecipeService?
    var recipe: TempRecipe?
    var detailedRecipe: DetailedRecipes?
    var singleRecipeContainer: SingleRecipeContainer?
    
    @IBOutlet weak var LikeButton: UIBarButtonItem!
    @IBAction func LikeButtonPressed(_ sender: Any) {
        if LikeButton.image == UIImage(named: "emptyHeart") {
            LikeButton.image = UIImage(named: "filledHeart")
            
            //                if let detailedRecipe = detailedRecipe {
            //                    RecipeController.sharedController.favoriteRecipe(recipe: detailedRecipe)
            //                    print("recipeSaved")
            //
            //
            //
            //                }
            
            
        }
        else if LikeButton.image == UIImage(named: "filledHeart") {
            LikeButton.image = UIImage(named: "emptyHeart")
            
            
            
            // ADD function to remove from favorites
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        print("this is the recipe in detailed view: \(recipe?.name)")
        if let recipe = recipe {
            service?.getData(tempRecipe: recipe, completion: { (recipe) in
                self.singleRecipeContainer = recipe
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
                
            })
        } else if detailedRecipe != nil {
            tableView.reloadData()
            
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
}

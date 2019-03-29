//
//  RecipieCollectionViewController.swift
//  FoodPantry
//
//  Created by Makay Chapple on 2/8/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

private let reuseIdentifier = "FoodCell"
let handleTextChangeNotification = "handleTextChangeNotification"

class RecipieCollectionViewController: UICollectionViewController, UISearchBarDelegate {
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filtered:[String] = []
    var searchActive: Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet weak var foodCell: FoodCell!
    
    var recipes: [TempRecipe]?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        self.searchController.delegate = self as? UISearchControllerDelegate
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        
        self.navigationItem.titleView = searchController.searchBar
        
        
        
        
        
        
        
        
        
        //setupConstraints()
        
        
        (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing = 20
        (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        let bacon: String? = "bacon"
        if let searchBarText = searchController.searchBar.text ?? bacon{
            getData(tempRecipe: recipes, searchTerm: searchBarText) { ([TempRecipe]?) in
                if let recipes = self.recipes {
                    self.recipes = recipes
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        if let searchBarText = searchBar.text {
            getData(tempRecipe: recipes, searchTerm: searchBarText) { ([TempRecipe]?) in
                if let recipes = self.recipes {
                    self.recipes = recipes
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func getData(tempRecipe: [TempRecipe]?, searchTerm: String, completion: @escaping ([TempRecipe]?) -> Void) {
        if let searchBarText = searchController.searchBar.text {
            
            RecipeController.sharedController.getRecipes(searchTerm: searchBarText ) { recipeArray in
                if let recipes = recipeArray {
                    self.recipes = recipes
                    print(recipes)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                        
                    }
                }
            }
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK:
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        else
        {
            if let recipies = recipes{
                return recipies.count
                
            }
        }
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FoodCell
        let recipe = recipes?[indexPath.row]
        if let recipe = recipe {
            cell.updateCell(recipe: recipe)
        }
        // Configure the cell
        
        return cell
    }
    
    
    // MARK: SearchBar functionality
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            if let nextController = segue.destination as? DetailedRecipeViewController,
                let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                nextController.service = NetworkDetailedRecipeService()
                // nextController.service = StubDetailRecipeService()
                nextController.recipe = recipes?[indexPath.row]
            }
        }
    }
}


class FoodCell: UICollectionViewCell {
    @IBOutlet weak var FoodImage: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    func updateCell(recipe: TempRecipe) {
        self.foodLabel.text = recipe.name
        self.layer.cornerRadius = 12
        
//        if let url: URL = URL(string: recipe.image) {
//            NetworkController.preformNetworkRequest(for: url, completion: { (data) in
//                if let data = data {
//                    let image = UIImage(data: data)
//                    DispatchQueue.main.async {
//                        self.FoodImage.image = image
//                    }
//                }
//            })
//        }
    }
}


//
//  foodCell.swift
//  FoodPantry
//
//  Created by Makay Chapple on 3/4/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit

class DetailFoodCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("DetailFoodCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(recipe: SingleRecipeContainer) {
        let networkController = NetworkController()
        
        if let url: URL = URL(string: recipe.recipe.image!) {
            networkController.performNetworkRequest(for: url, completion: { (data)
                in
                if let data = data {
                    let image = UIImage(data: data)
                    let ingrediantString = recipe.recipe.ingredients?.joined(separator: "\n")
                    DispatchQueue.main.async {
                        self.detailedImage.image = image
                        self.descriptionLabel.text = ingrediantString
                        print(ingrediantString)
                    }
                }
            })
        }
    }

}

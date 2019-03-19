//
//  ViewController.swift
//  messing around with api and storing data
//
//  Created by Makay Chapple on 1/3/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UIImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    let imageURL = URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/intermediary/f/71322abc-fa0a-439f-95a5-3609611839d9/d1k1bj7-cba7405d-47a8-4a17-861c-32300918def5.jpg")!
    
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
        if error == nil {
            let loadedImage = UIImage(data: data)
            
            self.imageContainer.image = loadedImage
        }
    }
    
}
}


//
//  MainTabBarController.swift
//  tabbat
//
//  Created by Makay Chapple on 10/5/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
        
        override func viewDidLoad() {
            
    
           let info = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            
            for child in self.children where child is InfoViewController {
                guard let infoVC = child as? InfoViewController else { return }
                infoVC.setInfo(with: info)
            }
    }
}

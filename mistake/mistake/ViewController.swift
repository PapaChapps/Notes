//
//  ViewController.swift
//  mistake
//
//  Created by Makay Chapple on 12/11/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            sleep(4)
            DispatchQueue.main.async {
                self.textlabel.text = "Hello from the backround thread"
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}


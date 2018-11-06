//
//  ViewController.swift
//  sequay
//
//  Created by Makay Chapple on 10/4/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func textField(_ sender: UITextField) {
        return
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
}


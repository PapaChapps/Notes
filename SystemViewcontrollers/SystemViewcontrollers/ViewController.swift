//
//  ViewController.swift
//  SystemViewcontrollers
//
//  Created by Makay Chapple on 11/7/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func Sharebuttontapped(_ sender: UIButton) {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        
    }
    
    @IBAction func SafariButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func CameraButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func EmailButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alertButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Title",
                                                message: "This is an alert",
                                                preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        let delete = UIAlertAction(title: "Delete", style: .destructive) {
             _ in
            self.view.backgroundColor = .black
        }
        alertController.addAction(delete)
        present(alertController, animated: true) {
            
        }
    }
    
}


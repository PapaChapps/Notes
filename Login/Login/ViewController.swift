//
//  ViewController.swift
//  Login
//
//  Created by Makay Chapple on 11/5/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBAction func logInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginSucceded", sender: LoginButton)
    }
    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameorPassword", sender: forgotUsernameButton)
        
    }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameorPassword", sender: forgotPasswordButton)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        }else{
            segue.destination.navigationItem.title = userNameTextField.text
            
        }
        
    }
    

}


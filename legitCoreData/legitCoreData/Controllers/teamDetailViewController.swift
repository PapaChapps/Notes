//
//  teamDetailViewController.swift
//  legitCoreData
//
//  Created by Makay Chapple on 1/11/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit

class teamDetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var goalsTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
   
    var team: Team? {
        didSet {
            guard let team = team else { return }
            
            nameTextField.text = team.teamName
            playerTextField.text = team.favoritePlayer
            goalsTextField.text = "\(team.goalsScored)"
            
        }
    }

    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name =  nameTextField.text,
        let goals = goalsTextField.text,
        let player = playerTextField.text,
        let goalsDouble = Double(goals) else {
            return
            
        }
        
        
        if let team = team {
            team.teamName = name
            team.favoritePlayer = player
            team.goalsScored = goalsDouble
            TeamController.sharedController.save()
        }else{
            TeamController.sharedController.creatTeam(name: name, player: player, goals: goalsDouble)
            
            
        }
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    

    
}

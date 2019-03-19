//
//  ViewController.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/15/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
     var score = 0
    @IBAction func cardTapped(_ sender: Any) {
        scoreLabel.text = "\(score)"
        if card?.value == "JACK" {
            
            score += 1
            
        } else {
            
            score -= 1
            
        }
    }
    
    @IBAction func startButtontapped(_ sender: Any) {
       
        updateCard()
        runTimer()
        self.startButton.alpha = 0
    }
    var timer = Timer()
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBOutlet weak var remainingCardsTextLabel: UILabel!
    var remainingCards = 52
    @objc func updateTimer() {
        remainingCardsTextLabel.text = "\(remainingCards)"
        if remainingCards != 0 {
            
            remainingCards -= 1
            
        } else {
            if let deck = deck {
            DeckController.sharedController.deleteDeck(deck: deck)
            }
        }
        if self.remainingCards == 0 {
            self.timer.invalidate()
            
        }
        updateCard()
        }
        
    
        
    

    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cardImage: UIImageView!

    var deck: Deck?
    var card: Card?
    
    
    override func validateValue(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKey inKey: String) throws {
        
    }

//    @IBAction func pauseButtonTapped(_ sender: Any) {
//
//        let alert = UIAlertController (title: "Pause", message: "", preferredStyle: .actionSheet)
//        _ = alert.addAction(UIAlertAction(title: "save", style: .default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
//
//        self.present(alert, animated: true)
//
//    }
    
    // MARK: score board settings
    
    
    @objc func updateCard() {
        DeckController.sharedController.drawCard(deck: deck) { (card) in
            if let card = card,
                let url = card.imageURL {
                self.card = card
                
                if let url: URL = URL(string: url) {
                    networkController.preformNetworkRequest(for: url, completion: { (data) in
                        if let data = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                self.cardImage.image = image
                            }
                            
                        }
                    })
                }
            }
            

        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeckController.sharedController.createDeck()
        deck = DeckController.sharedController.deck.first
       

       

        
        
        
    }
    
    
}


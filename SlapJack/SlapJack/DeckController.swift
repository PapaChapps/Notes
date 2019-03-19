//
//  DeckController.swift
//  SlapJack
//
//  Created by Makay Chapple on 1/16/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData


class DeckController {
    
    var deck: [Deck] {
        let request:NSFetchRequest<Deck> = Deck.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
        
        
    }
    
    static let sharedController = DeckController()
    
    func drawCard(deck: Deck?,  completion : @escaping (Card?) -> Void) {
        guard let deck = deck else { return }
        let baseURL = "https://deckofcardsapi.com/api/deck/\(deck.deck_id ?? "")/draw/?count=1"
        guard let url = URL(string: baseURL) else {
            return
        }
        networkController.preformNetworkRequest(for: url) { (data) in
            
            do {
                let jsonObjects = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                if let objects = jsonObjects as? Dictionary<String, Any> {
                    if let cards = objects["cards"]  as? [Dictionary<String, Any>] {
                         if let card = Card(dictionary: cards.first!){
                        
                        completion(card)
                            return
                        }
                        
                    }
                    
                }
            } catch {
                print (error)
            }
        }
        completion(nil)
        return
    }
    
    func saveGame(context: NSManagedObjectContext) {
        do {
            
            try context.save()
            
        } catch {
            print("REEEEEE")
        }
        
    }
    func deleteDeck(deck: Deck) {
        Stack.context.delete(deck)
    }
    
    func createDeck() {
        guard let url = URL(string: "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1") else { return }
     
            
        
        networkController.preformNetworkRequest(for: url) { (data) in
            do {
                
                let jsonDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                _ = Deck(dictionary: jsonDict ?? [:], context: Stack.context)
                
                DeckController.sharedController.saveGame(context: Stack.context)
            } catch {
                print(error)
            }
        }
    }
    
    
    func saveDeck(vDeck: Deck) {
        let deck = vDeck.deck_id
        let remaining = vDeck.remainingCards
        
        let myDeck = Deck(context: Stack.context)
        myDeck.deck_id = deck
        myDeck.remainingCards = remaining
        saveToPersistanceStorage()
    }
    
    func deleteDeck(vDeck: Deck) {
        Stack.context.delete(vDeck)
        saveToPersistanceStorage()
    }
    
    private func saveToPersistanceStorage() {
        do {
            try Stack.context.save()
        } catch {
            print("AHHH")
        }
    }
}


//
//  teamController.swift
//  legitCoreData
//
//  Created by Makay Chapple on 1/11/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

class TeamController {
    static let sharedController = TeamController()
    
    var teams: [Team] {
        let request: NSFetchRequest<Team> = Team.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    func creatTeam(name: String, player: String, goals: Double) {
        let _ = Team(name: name, player: player, numberOfGoals: goals)
        save()
    }
    func delete(team: Team) {
        Stack.context.delete(team)
        save()
    }
    
    func save() {
        do {
            try Stack.context.save()
            
        } catch {
            print(" couldnt save data")
        }
        
    }
}




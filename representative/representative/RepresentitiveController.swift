//
//  RepresentitiveViewController.swift
//  representative
//
//  Created by Makay Chapple on 1/14/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import CoreData

class RepresentativeController {
    
    static let sharedController = RepresentativeController()
    
    let baseURL = "https://whoismyrepresentative.com/getall_mems.php?&output=json&zip="
    
    var representatives: [Representative] {
        
        let request: NSFetchRequest<Representative> = Representative.fetchRequest()
        
        do {
            
            return try Stack.context.fetch(request)
        
        } catch {
            return []
            
        }
    }
    
    func searchForReps(zipcode: String, completion: (([Representative]?) -> Void)? = nil) {
        guard let url = URL(string: baseURL + zipcode) else {
            print("add zipcode")
            return
        }
        networkController.preformNetworkRequest(for: url) { ( data, error) in
            guard let data = data else { return }
            
            do {
                let jsonObjects = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = jsonObjects as? Dictionary<String, [Dictionary<String, Any>]>,
                    let results = dictionary["results"] {
                        var reps: [Representative] = []
                        for rep in results {
                            if let representative = Representative(dictionary: rep) {
                                reps.append(representative)
                            }
                        }
                    
                        if let completion = completion {
                            completion(reps)
                        }
                    }
                } catch {
                print (error)
            }
        }
    }
    
    
    
    func deleteRep(rep: Representative) {
        Stack.context.delete(rep)
        saveToPersistantStorage()
        
    }
    
    func saveRep(rep: Representative) {
        guard let name = rep.name,
            let phoneNumber = rep.phoneNumber,
            let address = rep.address else {return}
        
        for representatives in representatives {
            deleteRep(rep: representatives)
        }
        let myRep = Representative(context: Stack.context)
        myRep.name = name
        myRep.address = address
        myRep.phoneNumber = phoneNumber
        saveToPersistantStorage()
        
    }
    
    private func saveToPersistantStorage() {
        
        do {
            try Stack.context.save()
            
        } catch {
            print("REEEEE")
        }
        
    }
}

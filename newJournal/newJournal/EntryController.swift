//
//  EntryController.swift
//  newJournal
//
//  Created by Makay Chapple on 11/2/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import Foundation

class EntryController {
    var entries: [Entry] = []
    static let sharedInstance = EntryController()
    
    func addEntry( title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
    }
}

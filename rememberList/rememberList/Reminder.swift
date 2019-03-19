//
//  Reminder.swift
//  rememberList
//
//  Created by Makay Chapple on 1/8/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//
import CoreData
import Foundation

class Reminder: NSManagedObject {
    @NSManaged var reminder: String?
}

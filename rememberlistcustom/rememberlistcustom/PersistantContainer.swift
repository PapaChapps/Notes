//
//  PersistantContainer.swift
//  rememberlistcustom
//
//  Created by Makay Chapple on 1/10/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let container = NSPersistentContainer(name: "Model")
func loadStores () {
container.loadPersistentStores(completionHandler: {(storeDescription, error) in container }
)
}

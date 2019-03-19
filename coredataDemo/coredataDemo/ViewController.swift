//
//  ViewController.swift
//  coredataDemo
//
//  Created by Makay Chapple on 1/7/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue( "joejoe", forKey: "username")
        newUser.setValue( "tyler", forKey: "password")
        newUser.setValue( "19", forKey: "age")
        
        do {
            try context.save()
        } catch {
            print("failed save")
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print("data Group start")
                print(data.value(forKey: "username") as! String)
                print(data.value(forKey: "password") as! String)
                print(data.value(forKey: "age") as! String)
                print("data group end")
            }
        } catch {
            print("failed to fetch data")
        }
    }


}

let alert = UIAlertController( title: "", message: "", preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "Do it", style: .default, handler: nil))


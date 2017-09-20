//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Raddaoui Mohamed Raid on 9/4/17.
//  Copyright © 2017 tn.esprit.iOS_TEST. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
}

//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Raddaoui Mohamed Raid on 9/4/17.
//  Copyright © 2017 tn.esprit.iOS_TEST. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}

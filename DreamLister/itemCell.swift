//
//  itemCell.swift
//  DreamLister
//
//  Created by Raddaoui Mohamed Raid on 9/9/17.
//  Copyright © 2017 tn.esprit.iOS_TEST. All rights reserved.
//

import UIKit

class itemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    

    func configureInfoCell(item:Item){
    
    
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
    }


}


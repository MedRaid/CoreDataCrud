//
//  MainVC.swift
//  DreamLister
//
//  Created by Raddaoui Mohamed Raid on 9/4/17.
//  Copyright © 2017 tn.esprit.iOS_TEST. All rights reserved.
//

import UIKit
import CoreData
class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        generateDate()
        attemptFetch()
    }

    
    
    
    //nb of sections in tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            
            
            return sections.count
        }
        
        return 0
    }
    
    // nb of rowns in secton
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
        
        let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    
    
    func configureCell(cell:itemCell,indexPath:NSIndexPath)
    {
        //update cell
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureInfoCell(item: item)
    }
    
    //select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let objects = controller.fetchedObjects, objects.count > 0 {
        
            let itema = objects[indexPath.row]
                performSegue(withIdentifier: "ItemDetails", sender: itema)
        
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetails" {
        
            if let destination = segue.destination as? ItemDetailsVC{
                if let item = sender as? Item {
                    destination.itemToEdit = item
                }
            }
        
        }
        
        
    }
    
    
    
    
    //configure cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! itemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func attemptFetch(){
    
        let fetchRequests:NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequests.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequests, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        
        
        controller.delegate = self
        self.controller = controller
        
        do {
            
        try controller.performFetch()
            
        } catch { let error = error as NSError
            print("\(error)")}
        
        
    }
    
        func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
        {
        tableView.beginUpdates()
        }
        
        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
        {
        tableView.endUpdates()
        }
        
        
   
    
        func controller(_ controller:NSFetchedResultsController<NSFetchRequestResult>,didChange anObject: Any, at indexPath:
            IndexPath?, for type: NSFetchedResultsChangeType,newIndexPath:
            IndexPath?){
            
            switch (type) {
                
            case .insert:
                if let indexPath = newIndexPath
                {tableView.insertRows(at: [indexPath], with: .fade)}
                break
                
                
            case .delete:
                if let indexPath = indexPath
                {tableView.deleteRows(at: [indexPath], with: .fade)}
                break
                
            case .update:
                if let indexPath = indexPath
                {
                    let cell = tableView.cellForRow(at: indexPath) as! itemCell
                //update cell data
                    configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                    
                }
                break
                
            case .move:
                if let indexPath = indexPath
                {tableView.deleteRows(at: [indexPath], with: .fade)}
                
                if let indexPath = newIndexPath
                {tableView.insertRows(at: [indexPath], with: .fade)}
                break
                
                
            }
            
        }
        
        
   
    
    
    
    
    func generateDate()
    {
//        let item = Item(context: context)
//        item.title = "macbook pro"
//        item.price = 1800
//        item.details = "i cant wait dude i want the new one"
//        
//        let item2 = Item(context: context)
//        item2.title = "hedphones "
//        item2.price = 300
//        item2.details = "cool base and nice sound"
//        
//        let item3 = Item(context: context)
//        item3.title = "KTM"
//        item3.price = 2500
//        item3.details = "what a sound and what a moto"
//        
//        ad.saveContext()
    }
    
    
}






















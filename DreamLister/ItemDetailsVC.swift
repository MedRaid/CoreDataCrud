//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Raddaoui Mohamed Raid on 9/14/17.
//  Copyright © 2017 tn.esprit.iOS_TEST. All rights reserved.
//

import UIKit
import CoreData
class ItemDetailsVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var titles: UITextField!
   
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var details: UITextField!
    @IBOutlet weak var storepicker: UIPickerView!

    var stores = [Store]()
    
    var itemToEdit: Item?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
        
        topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
       //  create stores to save in coredata
//        
//        let store = Store(context: context)
//        store.name = "Apple"
//        
//        let store1 = Store(context: context)
//        store1.name = "Soug Libya"
//        
//        let store2 = Store(context: context)
//        store2.name = "Magasin generale"
//        
//        let store3 = Store(context: context)
//        store3.name = "Trush"
//        
//        let store4 = Store(context: context)
//        store4.name = "ebay"
//        
//        let store5 = Store(context: context)
//        store5.name = "Germany buy"
//        
//        ad.saveContext()

     
        getStores()
        
        if itemToEdit != nil {
        
            loadItemData()
        
        }
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return stores[row].name
    let store = stores[row]
        return store.name
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    
    
    func getStores(){
        
        let fetchRequest:NSFetchRequest<Store> = Store.fetchRequest()
        
        do{
            self.stores = try context.fetch(fetchRequest)
            self.storepicker.reloadAllComponents()
        
        } catch{
               //handle error
               }
        
        
    }
    
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        
        if (itemToEdit == nil){
            
            item = Item(context: context)
            
        }
        
        else {
            item = itemToEdit
        }
        

        // create only
    //   let item = Item(context: context)

        
        if let titlee = titles.text{
        item.title = titlee
        }
       
        if let price = price.text{
            item.price = (price as NSString).doubleValue
        }
        
        if let details = details.text{
            item.details = details
        }
        
        item.toStore = stores[storepicker.selectedRow(inComponent: 0)]
    
        ad.saveContext()
        
        
       _ = navigationController?.popViewController(animated: true)
        

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "accueil") as! MainVC
//        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    func loadItemData(){
        
        if let item = itemToEdit{
        
            titles.text = item.title
            price.text = "\(item.price)"
            details.text = item.details
        
            if let store = item.toStore{

                for i in 0 ... stores.count {
                
                if (stores[i].name == store.name)

                    {
                    storepicker.selectRow(i, inComponent: 0, animated: false)
                        break
                    }
                
                }
                
                
//                var index = 0
//                repeat {
//                    
//                } while (index < stores.count)
                
            }
            
        }
        
        
        
    }
    


    
    
    
    
}


























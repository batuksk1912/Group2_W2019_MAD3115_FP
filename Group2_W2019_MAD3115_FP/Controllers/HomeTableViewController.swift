//
//  HomeTableViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-22.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //save()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                print("View Products")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let productVC = sb.instantiateViewController(withIdentifier: "productVC") as! ProductsViewController
                self.present(productVC, animated: true, completion: nil)
            case 1:
                print("View Cart")
            default:
                print("Invalid Option")
            }
        }else{
            switch indexPath.row {
            case 0:
                print("View past orders")
            case 1:
                print("Logout")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = sb.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
                self.present(loginVC, animated: true, completion: nil)
            default:
                print("Invalid Option")
            }
        }
    }
    /*
    func save() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let productsEntity = NSEntityDescription.entity(forEntityName: "Products", in: managedContext)!
        let products = NSManagedObject(entity: productsEntity, insertInto: managedContext)
        
        products.setValue("3", forKey: "productId")
        products.setValue("iPhone XR", forKey: "productName")
        products.setValue(999.0, forKey: "price")
        do {
            try managedContext.save()
            print("saved.")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
 */
    


}

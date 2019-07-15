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
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "viewProducts", sender: nil)
            case 1:
                performSegue(withIdentifier: "viewShoppingCart", sender: nil)
            default:
                print("Error!")
            }
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                print("View past orders")
            case 1:
                performSegue(withIdentifier: "profile", sender: nil)
            case 2:
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = sb.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
                self.present(loginVC, animated: true, completion: nil)
            default:
                print("Error!")
            }
        } else {
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "about", sender: nil)
            case 1:
                performSegue(withIdentifier: "contact", sender: nil)
            default:
                print("Error!")
            }
            
        }
    }
    
    func save() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let productsEntity = NSEntityDescription.entity(forEntityName: "Products", in: managedContext)!
        let products = NSManagedObject(entity: productsEntity, insertInto: managedContext)
        
        products.setValue("5", forKey: "productId")
        products.setValue("Apple TV", forKey: "productName")
        products.setValue(599.0, forKey: "price")
    
        do {
            try managedContext.save()
            print("saved.")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

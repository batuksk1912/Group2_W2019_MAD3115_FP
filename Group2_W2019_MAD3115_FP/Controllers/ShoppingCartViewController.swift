//
//  ShoppingCartViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-23.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class ShoppingCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var shoppingCarts : [ShoppingCart]? 
    
    @IBOutlet weak var shoppingCartTable: UITableView!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cart Items"
        self.shoppingCartTable.delegate = self
        self.shoppingCartTable.dataSource = self
        fetchData()
    }
    
    @IBAction func btnCheckoutTapped(_ sender: UIButton) {
         performSegue(withIdentifier: "viewCheckout", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCarts!.filter{ $0.customer?.userId! == userDefault.string(forKey: "id")}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell") as! ShoppingCartTableViewCell
        let carts = self.shoppingCarts?[indexPath.row]
        resultCell.productID.text = carts!.productId
        for i in (carts?.products)! {
            let p = i as! Products
            resultCell.productName.text = p.productName
            resultCell.price.text = String(p.price)
        }
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteItemFromShoppingCart(at: indexPath)
        }
    }
    
    func fetchData()
    {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<ShoppingCart>(entityName: "ShoppingCart")
        request.predicate = NSPredicate(format: "customer.userId = %@", userDefault.string(forKey: "id")!)
        do {
            shoppingCarts = try context.fetch(request)
            shoppingCartTable.reloadData()
        }
        catch { print(error) }
    }
    
    func deleteItemFromShoppingCart(at indexPath: IndexPath) {
        let carts = self.shoppingCarts?[indexPath.row]
        
        guard let context = carts?.managedObjectContext else {
            return
        }
        context.delete(carts!)
        do {
            try context.save()
            shoppingCarts?.remove(at: indexPath.row)
            shoppingCartTable.deleteRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            shoppingCartTable.reloadRows(at: [indexPath], with: .automatic)
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

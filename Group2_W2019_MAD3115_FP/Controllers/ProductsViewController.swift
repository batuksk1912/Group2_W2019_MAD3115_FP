//
//  ProductsViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-22.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
  
    private var products : [Products] = []

    @IBOutlet weak var productTable: UITableView!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Products"
        self.productTable.delegate = self
        self.productTable.dataSource = self
        getData()
    }
    
    func currentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    @objc func addShoppingCart(sender: UIButton){
        let p = self.products[sender.tag]
        let managedContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let cart = ShoppingCart(context: managedContext)
        let c = getCustomerById(contactIdentifier: userDefault.string(forKey: "id")!)
        cart.cartId = userDefault.string(forKey: "id")!
        cart.productId = p.productId
        cart.dateAdded = currentDate()
        cart.quantity = 1
        c.addToShoppingCart(cart)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        let alert = UIAlertController(title: "Success", message: "Added to Cart!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductsTableViewCell
        let products = self.products[indexPath.row]
        resultCell.productId.text = products.productId!
        resultCell.productName.text = products.productName!
        resultCell.price.text = String(products.price)
        resultCell.addCart.tag = indexPath.row
        resultCell.addCart.addTarget(self, action: #selector(addShoppingCart), for: .touchUpInside)
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func getData()
    {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            products = try managedContext.fetch(Products.fetchRequest())
        }
        catch{
            print("Fetch Failed")
        }
    }
    
    func getCustomerById(contactIdentifier: String) -> Customer {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        userFetch.fetchLimit = 1
        userFetch.predicate = NSPredicate(format: "userId = %@", contactIdentifier)
        
        let users = try! managedContext.fetch(userFetch)
        
        let customer: Customer = users.first as! Customer
        return customer
    }

}

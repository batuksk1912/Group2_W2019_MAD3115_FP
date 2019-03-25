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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    @objc func addShoppingCart(sender: UIButton){
        let customer = getCustomer(id: userDefault.string(forKey: "id")!)
        let product = self.products[sender.tag]
        let managedContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let cart = ShoppingCart(context: managedContext)
        cart.cartId = UUID().uuidString
        cart.productId = product.productId!
        cart.dateAdded = currentDate()
        cart.quantity = 1
        cart.customer = customer
        cart.addToProducts(product)
        //customer.addToShoppingCart(cart)
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
    
    func fetchData()
    {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            products = try managedContext.fetch(Products.fetchRequest())
            productTable.reloadData()
        }
        catch{
            print("Fetch Request Failed!")
        }
    }
    
    func currentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    func getCustomer(id: String) -> Customer {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        userFetch.fetchLimit = 1
        userFetch.predicate = NSPredicate(format: "userId = %@", id)
        let users = try! managedContext.fetch(userFetch)
        let customer: Customer = users.first as! Customer
        return customer
    }
}

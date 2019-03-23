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

     private var shoppingCarts : [ShoppingCart] = []
        
    @IBOutlet weak var shoppingCartTable: UITableView!
    
    
    
    
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CART ITEMS"
        self.shoppingCartTable.delegate = self
        self.shoppingCartTable.dataSource = self
        getData()
    
    }
    
    @IBAction func btnCheckoutTapped(_ sender: UIButton) {
        
         performSegue(withIdentifier: "viewCheckout", sender: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total carts= ", shoppingCarts.count)
        return shoppingCarts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell") as! ShoppingCartTableViewCell
        print(self.shoppingCarts[0].customer?.shoppingCart)
        let carts = self.shoppingCarts[indexPath.row]
        
        print("cart ID= ", carts.cartId!)
        
        resultCell.productID.text = carts.cartId!
        resultCell.productName.text = "0"
        resultCell.price.text = "0" //String(products.price)
        resultCell.removeFromCart.tag = indexPath.row
        //resultCell.removeFromCart.addTarget(self, action: #selector(removeFromShoppingCart), for: .touchUpInside)
        return resultCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func getData()
    {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            shoppingCarts = try managedContext.fetch(ShoppingCart.fetchRequest())
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

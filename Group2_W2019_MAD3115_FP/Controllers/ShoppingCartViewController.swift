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
        self.navigationItem.title = "CART ITEMS"
        self.shoppingCartTable.delegate = self
        self.shoppingCartTable.dataSource = self
        getData()
    }
    
    @IBAction func btnCheckoutTapped(_ sender: UIButton) {
         performSegue(withIdentifier: "viewCheckout", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCarts!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell") as! ShoppingCartTableViewCell
        let carts = self.shoppingCarts?[indexPath.row]
        dump(carts?.productArray?[0])
        resultCell.productID.text = carts?.productId!
        resultCell.productName.text = carts?.productArray?[0].productName!
        resultCell.price.text = String((carts?.productArray?[indexPath.row].price)!)
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
    
    func getProductById(contactIdentifier: String) -> (String) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        var sc = [ShoppingCart]()
        let request = NSFetchRequest<ShoppingCart>(entityName: "ShoppingCart")
        request.fetchLimit = 1
        
        request.predicate = NSPredicate(format: "cartId = %@", contactIdentifier)
        do {
            sc = try context.fetch(request)
        }
        catch { print(error) }
        var productName: String = ""
        for person in sc {
            for s in person.products! {
                productName = (s as! Products).productName!
                break
            }
        }
        return productName
    }
    
   

}

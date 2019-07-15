//
//  CheckoutViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-23.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var checkoutTable: UITableView!
    
    let userDefault = UserDefaults.standard
    
    var cartItems: [ShoppingCart]?
    
    var orders: [Orders]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Checkout"
        self.checkoutTable.delegate = self
        self.checkoutTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        let customer = getCustomer(id: userDefault.string(forKey: "id")!)
        let managedContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let order = Orders(context: managedContext)
        let detail = OrderDetails(context: managedContext)
        let info = ShippingInfo(context: managedContext)
        info.shippingId = UUID().uuidString
        info.shippingType = "Regular"
        info.shippingCost = 10.0
        order.orderId = UUID().uuidString
        order.shippingId = info.shippingId
        order.dateCreated = currentDate()
        order.dateShipped = currentDate()
        order.customerId = customer.userId
        order.customerName = customer.customerName
        order.status = "Shipped"
        order.shippingInfo = info
        for ca in cartItems! {
        for c in ca.products! {
            let p = c as! Products
            detail.orderId = order.orderId
            detail.productId = p.productId
            detail.productName = p.productName
            order.orderDetails = detail
            do {
                try managedContext.save()
                print("saved.")
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        }
        fetchOrderData()
        checkoutTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (orders?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order")
        let orderCell = self.orders?[indexPath.row]
        cell!.textLabel?.text = "Order ID : " + orderCell!.orderId!
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //remove codes.
    }
    
    func fetchData()
    {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<ShoppingCart>(entityName: "ShoppingCart")
        request.predicate = NSPredicate(format: "customer.userId = %@", userDefault.string(forKey: "id")!)
        do {
            cartItems = try context.fetch(request)
        }
        catch { print(error) }
    }
    
    func fetchOrderData()
    {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<Orders>(entityName: "Orders")
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "customerId = %@", userDefault.string(forKey: "id")!)
        do {
            orders = try context.fetch(request)
        }
        catch { print(error) }
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

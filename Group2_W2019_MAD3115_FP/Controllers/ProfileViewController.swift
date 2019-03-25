//
//  ProfileViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-25.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var shipping: UITextField!
    
    let userDefault = UserDefaults.standard
    var customer: Customer?

    var fetchedCustomer : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customer = getCustomer(id: userDefault.string(forKey: "id")!)
        id.text = customer?.userId
        password.text = customer?.password
        name.text = customer?.customerName
        mail.text = customer?.email
        address.text = customer?.address
        creditCard.text = customer?.creditCardInfo
        shipping.text = customer?.shippingInfo
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        customer!.setValue(password.text!, forKey: "password")
        customer!.setValue(name.text!, forKey: "customerName")
        customer!.setValue(mail.text!, forKey: "email")
        customer!.setValue(address.text, forKey: "address")
        customer!.setValue(creditCard.text, forKey: "creditCardInfo")
        customer!.setValue(shipping.text, forKey: "shippingInfo")
        
        //Update Context
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
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

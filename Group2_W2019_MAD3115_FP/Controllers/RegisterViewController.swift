//
//  RegisterViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-23.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var shippingInfo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func register(_ sender: UIButton) {
        let managedContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let customer = Customer(context: managedContext)
        
        customer.userId = userName.text!
        customer.password = password.text!
        customer.loginStatus = "notlogin"
        customer.customerName = name.text!
        customer.address = adress.text!
        customer.email = mail.text!
        customer.creditCardInfo = creditCard.text
        customer.shippingInfo = shippingInfo.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

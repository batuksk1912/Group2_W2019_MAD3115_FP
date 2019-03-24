//
//  ViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-14.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rememberMe: UISwitch!
    
    var fetchedCustomer : [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        if let email = userDefault.string(forKey: "userEmail"){
            userName.text = email
        }
        if let pwd = userDefault.string(forKey: "userPassword"){
            password.text = pwd
            rememberMe.isOn = true
        }
    }
    
    func getData()
    {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            fetchedCustomer = try managedContext.fetch(Customer.fetchRequest())
        }
        catch{
            print("Fetch Failed")
        }
    }
    
    func testPrint() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        var cu = [Customer]()
        let request = NSFetchRequest<Customer>(entityName: "Customer")
        request.fetchLimit = 1
        do {
            cu = try context.fetch(request)
        }
        catch { print(error) }
        for person in cu {
            for s in person.shoppingCart! {
                print("Cart: ", (s as! ShoppingCart).dateAdded!)
                break
            }
        }
    }
    
    func deleteAllRecords() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        getData()
        testPrint()
        var isfound = false
        for i in fetchedCustomer
        {
            if(i.userId == userName.text)
            {
                isfound = true
                if(i.password == password.text)
                {
                    let userDefault = UserDefaults.standard
                    userDefault.set(userName.text, forKey: "id")
                    if rememberMe.isOn
                    {
                        userDefault.set(userName.text, forKey: "userEmail")
                        userDefault.set(password.text, forKey: "userPassword")
                    } else {
                        userDefault.removeObject(forKey: "userEmail")
                        userDefault.removeObject(forKey: "userPassword")
                    }
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let mainNC = sb.instantiateViewController(withIdentifier: "mainNC") as! MainNavigationController
                    present(mainNC,animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Username or Password Wrong!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
        if isfound == false
        {
            let alert = UIAlertController(title: "Error", message: "User not found!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}


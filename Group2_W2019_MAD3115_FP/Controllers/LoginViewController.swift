//
//  ViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-14.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var rememberMe: UISwitch!
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        if(userName.text == "test" && password.text == "123")
        {
            let userDefault =  UserDefaults.standard
            if rememberMe.isOn
            {
                userDefault.set(userName.text, forKey: "userEmail")
                userDefault.set(password.text, forKey: "userPassword")
            } else {
                print("Remove User/Password if previously stored...")
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
            }
            
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainNC = sb.instantiateViewController(withIdentifier: "mainNC") as! MainNavigationController
            present(mainNC,animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Username or Password Wrong!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
    }
    
}


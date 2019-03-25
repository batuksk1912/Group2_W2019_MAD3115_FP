//
//  MailViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-25.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var to: UITextField!
    
    var toArray: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contact"
    }
    
    @IBAction func sendMail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail()
        {
            let emailVC = MFMailComposeViewController()
            emailVC.mailComposeDelegate = self
            toArray?.append(to.text!)
            emailVC.setToRecipients(toArray)
            emailVC.setSubject(subject.text!)
            emailVC.setMessageBody(mail.text!, isHTML: true)
            present(emailVC, animated: true, completion: nil)
        }
        else{
            print("No Email Configured")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        dismiss(animated: true, completion: nil)
    }
}

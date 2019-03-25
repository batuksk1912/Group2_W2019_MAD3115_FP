//
//  AboutViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-25.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var myWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About"
        loadFile()
    }
    
    func loadFile() {
        let localFilePath = Bundle.main.url(forResource: "about", withExtension: "html")
        let urlRequest = URLRequest(url: localFilePath!)
        myWeb.load(urlRequest)
    }

}

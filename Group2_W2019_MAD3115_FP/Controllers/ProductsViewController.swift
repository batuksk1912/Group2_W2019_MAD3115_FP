//
//  ProductsViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-22.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
  
    private var products : [Products] = []

    @IBOutlet weak var productTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "test"
        self.productTable.delegate = self
        self.productTable.dataSource = self
        getData()
    
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
        
        return resultCell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func getData()
    {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            products = try managedContext.fetch(Products.fetchRequest())
        }
        catch{
            print("Fetch Failed")
        }
    }

}

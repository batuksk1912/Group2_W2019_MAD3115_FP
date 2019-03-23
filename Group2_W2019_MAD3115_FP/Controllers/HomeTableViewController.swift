//
//  HomeTableViewController.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-22.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                print("View Products")
            case 1:
                print("View Cart")
            default:
                print("Invalid Option")
            }
        }else{
            switch indexPath.row {
            case 0:
                print("View past orders")
            case 1:
                print("Logout")
            default:
                print("Invalid Option")
            }
        }
    }


}

//
//  ShoppingCartTableViewCell.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-23.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {

    @IBOutlet weak var productID: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}



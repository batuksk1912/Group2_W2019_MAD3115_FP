//
//  ProductsTableViewCell.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Danilo Esser on 2019-03-22.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addCart: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SpecialTextField.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-14.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit
import QuartzCore

class SpecialTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.4
        self.setValue(UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.6), forKeyPath: "_placeholderLabel.textColor")
        self.layer.sublayerTransform = CATransform3DMakeTranslation(5, 000, 0);
    
    }
}

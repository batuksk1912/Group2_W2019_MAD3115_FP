//
//  LoginButton.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-14.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class SpecialButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}

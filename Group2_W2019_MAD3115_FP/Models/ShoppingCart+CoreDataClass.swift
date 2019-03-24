//
//  ShoppingCart+CoreDataClass.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ShoppingCart)
public class ShoppingCart: NSManagedObject {
    
    var productArray: [Products]? {
        return self.products?.array as? [Products]
    }

}

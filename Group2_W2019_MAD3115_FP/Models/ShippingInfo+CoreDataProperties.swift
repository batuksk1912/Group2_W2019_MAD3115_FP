//
//  ShippingInfo+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension ShippingInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShippingInfo> {
        return NSFetchRequest<ShippingInfo>(entityName: "ShippingInfo")
    }

    @NSManaged public var shippingCost: Float
    @NSManaged public var shippingId: String?
    @NSManaged public var shippingType: String?
    @NSManaged public var orders: Orders?

}

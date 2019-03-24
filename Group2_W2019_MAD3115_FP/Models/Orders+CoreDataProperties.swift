//
//  Orders+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension Orders {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Orders> {
        return NSFetchRequest<Orders>(entityName: "Orders")
    }

    @NSManaged public var customerId: String?
    @NSManaged public var customerName: String?
    @NSManaged public var dateCreated: String?
    @NSManaged public var dateShipped: String?
    @NSManaged public var orderId: String?
    @NSManaged public var shippingId: String?
    @NSManaged public var status: String?
    @NSManaged public var customer: Customer?
    @NSManaged public var orderDetails: OrderDetails?
    @NSManaged public var shippingInfo: ShippingInfo?

}

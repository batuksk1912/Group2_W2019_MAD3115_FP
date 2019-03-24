//
//  OrderDetails+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension OrderDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderDetails> {
        return NSFetchRequest<OrderDetails>(entityName: "OrderDetails")
    }

    @NSManaged public var orderId: String?
    @NSManaged public var productId: String?
    @NSManaged public var productName: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var subTotal: Float
    @NSManaged public var unitCost: Float
    @NSManaged public var orders: Orders?
    @NSManaged public var products: NSOrderedSet?

}

// MARK: Generated accessors for products
extension OrderDetails {

    @objc(insertObject:inProductsAtIndex:)
    @NSManaged public func insertIntoProducts(_ value: Products, at idx: Int)

    @objc(removeObjectFromProductsAtIndex:)
    @NSManaged public func removeFromProducts(at idx: Int)

    @objc(insertProducts:atIndexes:)
    @NSManaged public func insertIntoProducts(_ values: [Products], at indexes: NSIndexSet)

    @objc(removeProductsAtIndexes:)
    @NSManaged public func removeFromProducts(at indexes: NSIndexSet)

    @objc(replaceObjectInProductsAtIndex:withObject:)
    @NSManaged public func replaceProducts(at idx: Int, with value: Products)

    @objc(replaceProductsAtIndexes:withProducts:)
    @NSManaged public func replaceProducts(at indexes: NSIndexSet, with values: [Products])

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Products)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Products)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSOrderedSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSOrderedSet)

}

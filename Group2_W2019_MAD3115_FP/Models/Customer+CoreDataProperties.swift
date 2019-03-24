//
//  Customer+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var address: String?
    @NSManaged public var creditCardInfo: String?
    @NSManaged public var customerName: String?
    @NSManaged public var email: String?
    @NSManaged public var shippingInfo: String?
    @NSManaged public var orders: NSOrderedSet?
    @NSManaged public var shoppingCart: NSOrderedSet?

}

// MARK: Generated accessors for orders
extension Customer {

    @objc(insertObject:inOrdersAtIndex:)
    @NSManaged public func insertIntoOrders(_ value: Orders, at idx: Int)

    @objc(removeObjectFromOrdersAtIndex:)
    @NSManaged public func removeFromOrders(at idx: Int)

    @objc(insertOrders:atIndexes:)
    @NSManaged public func insertIntoOrders(_ values: [Orders], at indexes: NSIndexSet)

    @objc(removeOrdersAtIndexes:)
    @NSManaged public func removeFromOrders(at indexes: NSIndexSet)

    @objc(replaceObjectInOrdersAtIndex:withObject:)
    @NSManaged public func replaceOrders(at idx: Int, with value: Orders)

    @objc(replaceOrdersAtIndexes:withOrders:)
    @NSManaged public func replaceOrders(at indexes: NSIndexSet, with values: [Orders])

    @objc(addOrdersObject:)
    @NSManaged public func addToOrders(_ value: Orders)

    @objc(removeOrdersObject:)
    @NSManaged public func removeFromOrders(_ value: Orders)

    @objc(addOrders:)
    @NSManaged public func addToOrders(_ values: NSOrderedSet)

    @objc(removeOrders:)
    @NSManaged public func removeFromOrders(_ values: NSOrderedSet)

}

// MARK: Generated accessors for shoppingCart
extension Customer {

    @objc(insertObject:inShoppingCartAtIndex:)
    @NSManaged public func insertIntoShoppingCart(_ value: ShoppingCart, at idx: Int)

    @objc(removeObjectFromShoppingCartAtIndex:)
    @NSManaged public func removeFromShoppingCart(at idx: Int)

    @objc(insertShoppingCart:atIndexes:)
    @NSManaged public func insertIntoShoppingCart(_ values: [ShoppingCart], at indexes: NSIndexSet)

    @objc(removeShoppingCartAtIndexes:)
    @NSManaged public func removeFromShoppingCart(at indexes: NSIndexSet)

    @objc(replaceObjectInShoppingCartAtIndex:withObject:)
    @NSManaged public func replaceShoppingCart(at idx: Int, with value: ShoppingCart)

    @objc(replaceShoppingCartAtIndexes:withShoppingCart:)
    @NSManaged public func replaceShoppingCart(at indexes: NSIndexSet, with values: [ShoppingCart])

    @objc(addShoppingCartObject:)
    @NSManaged public func addToShoppingCart(_ value: ShoppingCart)

    @objc(removeShoppingCartObject:)
    @NSManaged public func removeFromShoppingCart(_ value: ShoppingCart)

    @objc(addShoppingCart:)
    @NSManaged public func addToShoppingCart(_ values: NSOrderedSet)

    @objc(removeShoppingCart:)
    @NSManaged public func removeFromShoppingCart(_ values: NSOrderedSet)

}

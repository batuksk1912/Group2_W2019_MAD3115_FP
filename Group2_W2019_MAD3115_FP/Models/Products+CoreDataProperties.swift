//
//  Products+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var price: Float
    @NSManaged public var productId: String?
    @NSManaged public var productName: String?
    @NSManaged public var orderDetails: NSOrderedSet?
    @NSManaged public var shoppingCart: NSOrderedSet?

}

// MARK: Generated accessors for orderDetails
extension Products {

    @objc(insertObject:inOrderDetailsAtIndex:)
    @NSManaged public func insertIntoOrderDetails(_ value: OrderDetails, at idx: Int)

    @objc(removeObjectFromOrderDetailsAtIndex:)
    @NSManaged public func removeFromOrderDetails(at idx: Int)

    @objc(insertOrderDetails:atIndexes:)
    @NSManaged public func insertIntoOrderDetails(_ values: [OrderDetails], at indexes: NSIndexSet)

    @objc(removeOrderDetailsAtIndexes:)
    @NSManaged public func removeFromOrderDetails(at indexes: NSIndexSet)

    @objc(replaceObjectInOrderDetailsAtIndex:withObject:)
    @NSManaged public func replaceOrderDetails(at idx: Int, with value: OrderDetails)

    @objc(replaceOrderDetailsAtIndexes:withOrderDetails:)
    @NSManaged public func replaceOrderDetails(at indexes: NSIndexSet, with values: [OrderDetails])

    @objc(addOrderDetailsObject:)
    @NSManaged public func addToOrderDetails(_ value: OrderDetails)

    @objc(removeOrderDetailsObject:)
    @NSManaged public func removeFromOrderDetails(_ value: OrderDetails)

    @objc(addOrderDetails:)
    @NSManaged public func addToOrderDetails(_ values: NSOrderedSet)

    @objc(removeOrderDetails:)
    @NSManaged public func removeFromOrderDetails(_ values: NSOrderedSet)

}

// MARK: Generated accessors for shoppingCart
extension Products {

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

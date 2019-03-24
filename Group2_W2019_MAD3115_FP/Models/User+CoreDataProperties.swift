//
//  User+CoreDataProperties.swift
//  Group2_W2019_MAD3115_FP
//
//  Created by Baturay Kayatürk on 2019-03-24.
//  Copyright © 2019 Lambton College. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var loginStatus: String?
    @NSManaged public var password: String?
    @NSManaged public var userId: String?

}

//
//  DBFeedItems+CoreDataProperties.swift
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

import Foundation
import CoreData
import Pheeder

extension DBFeedItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBFeedItems> {
        return NSFetchRequest<DBFeedItems>(entityName: "DBFeedItems")
    }

    @NSManaged public var brief: String?
    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var isBookmared: Bool
    @NSManaged public var tiitle: String?
    @NSManaged public var url: URL?
    @NSManaged public var subscription: DBFeedSubscriptions?

}

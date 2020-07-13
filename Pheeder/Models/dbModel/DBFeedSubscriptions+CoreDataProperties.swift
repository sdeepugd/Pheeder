//
//  DBFeedSubscriptions+CoreDataProperties.swift
//  Pheeder
//
//  Created by deepak on 13/07/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

import Foundation
import CoreData
import Pheeder

extension DBFeedSubscriptions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBFeedSubscriptions> {
        return NSFetchRequest<DBFeedSubscriptions>(entityName: "DBFeedSubscriptions")
    }

    @NSManaged public var title: String?
    @NSManaged public var urrl: URL?
    @NSManaged public var feed: NSSet?

}

// MARK: Generated accessors for feed
extension DBFeedSubscriptions {

    @objc(addFeedObject:)
    @NSManaged public func addToFeed(_ value: DBFeedItems)

    @objc(removeFeedObject:)
    @NSManaged public func removeFromFeed(_ value: DBFeedItems)

    @objc(addFeed:)
    @NSManaged public func addToFeed(_ values: NSSet)

    @objc(removeFeed:)
    @NSManaged public func removeFromFeed(_ values: NSSet)

}

//
//  DBFeedSubscriptions+CoreDataProperties.m
//  Pheeder
//
//  Created by Deepu on 10/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

#import "DBFeedSubscriptions+CoreDataProperties.h"

@implementation DBFeedSubscriptions (CoreDataProperties)

+ (NSFetchRequest<DBFeedSubscriptions *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DBFeedSubscriptions"];
}

@dynamic title;
@dynamic url;
@dynamic feedDescription;
@dynamic feedId;
@dynamic image;
@dynamic feed;

@end
CREATE TABLE "PHEEDER_FEED_ITEM" (
    "ID"    INTEGER,
    "Title"    TEXT,
    "Url"    TEXT,
    "Date"    INTEGER,
    "Content"    TEXT,
    "Brief"    TEXT,
    "IsBookmarked"    INTEGER,
    "Subcription"    INTEGER,
    PRIMARY KEY("ID"),
    FOREIGN KEY("Subcription") REFERENCES "PHEEDER_FEED_SUBSCRIPTION"("ID")
)


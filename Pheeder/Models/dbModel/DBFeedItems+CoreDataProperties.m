//
//  DBFeedItems+CoreDataProperties.m
//  Pheeder
//
//  Created by Deepu on 10/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

#import "DBFeedItems+CoreDataProperties.h"

@implementation DBFeedItems (CoreDataProperties)

+ (NSFetchRequest<DBFeedItems *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DBFeedItems"];
}

@dynamic brief;
@dynamic content;
@dynamic date;
@dynamic isBookmared;
@dynamic tiitle;
@dynamic url;
@dynamic subscription;

@end

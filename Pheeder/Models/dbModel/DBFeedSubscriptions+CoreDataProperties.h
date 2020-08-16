//
//  DBFeedSubscriptions+CoreDataProperties.h
//  Pheeder
//
//  Created by Deepu on 10/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

#import "DBFeedSubscriptions+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DBFeedSubscriptions (CoreDataProperties)

+ (NSFetchRequest<DBFeedSubscriptions *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSURL *url;
@property (nullable, nonatomic, copy) NSString *feedDescription;
@property (nullable, nonatomic, copy) NSString *feedId;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSSet<DBFeedItems *> *feed;

@end

@interface DBFeedSubscriptions (CoreDataGeneratedAccessors)

- (void)addFeedObject:(DBFeedItems *)value;
- (void)removeFeedObject:(DBFeedItems *)value;
- (void)addFeed:(NSSet<DBFeedItems *> *)values;
- (void)removeFeed:(NSSet<DBFeedItems *> *)values;

@end

NS_ASSUME_NONNULL_END

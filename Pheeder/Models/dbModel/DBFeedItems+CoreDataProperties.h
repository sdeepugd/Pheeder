//
//  DBFeedItems+CoreDataProperties.h
//  Pheeder
//
//  Created by Deepu on 10/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//
//

#import "DBFeedItems+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DBFeedItems (CoreDataProperties)

+ (NSFetchRequest<DBFeedItems *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *brief;
@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nonatomic) BOOL isBookmared;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSURL *url;
@property (nullable, nonatomic, retain) DBFeedSubscriptions *subscription;

@end

NS_ASSUME_NONNULL_END

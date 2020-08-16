//
//  DBManager.h
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PersistenceImplementation
-(void)createDatabase;
-(void)addFeedSubscription:(Feed*)feed;
-(NSMutableArray<Feed*>*)getFeedSubscriptions;
-(void)deleteFeedSunscriptionWithTitle:(NSString*)title;
//-(void)addFeedItem:(FeedItem*)feedItem;
//-(NSArray<FeedItem*>*)getAllFeedItems;
//-(NSArray<FeedItem*>*)getFeedItemsWithSubscriptionTitle:(NSString*)title;
@end

@interface DBManager : NSObject <PersistenceImplementation>
+(id<PersistenceImplementation>)getDefaultImplementation;
@end

NS_ASSUME_NONNULL_END

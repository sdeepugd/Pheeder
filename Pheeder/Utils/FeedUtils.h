//
//  FeedUtils.h
//  Pheeder
//
//  Created by Deepu on 08/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
NS_ASSUME_NONNULL_BEGIN

@interface FeedUtils : NSObject
+(NSMutableArray*) searchFeed:(NSString*) query;
@end

NS_ASSUME_NONNULL_END

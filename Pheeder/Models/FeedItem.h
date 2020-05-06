//
//  FeedItem.h
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedItem : NSObject
@property (strong,nonatomic) NSString* title;
@property (strong,nonatomic) NSURL* itemURL;
@property (strong,nonatomic) NSDate* publishedDate;
@property (strong,nonatomic) NSString* content;
@property (strong,nonatomic) NSString* breif;
@end

NS_ASSUME_NONNULL_END

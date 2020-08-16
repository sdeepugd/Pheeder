//
//  Feed.h
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FeedItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface Feed : NSObject
@property (strong,nonatomic) NSURL* feedURL;
@property (strong,nonatomic) NSString* title;
@property (strong,nonatomic) NSString* feedID;
@property (strong,nonatomic) NSArray<NSString*>* topics;
@property (strong,nonatomic) NSString* feedDescription;
@property (strong,nonatomic) NSMutableArray<FeedItem*>* feedItems;
@property (strong,nonatomic) UIImage* blogImage;


-(instancetype)initWithUrl:(NSURL*)url;
-(void)downloadFeeds;
@end

NS_ASSUME_NONNULL_END

//
//  Feed.m
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (instancetype)initWithUrl:(NSURL *)url{
    if((self = [super init])){
        [self setFeedURL:url];
        self.feedItems = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)downloadFeeds {
    NSData *urlData = [NSData dataWithContentsOfURL:self.feedURL];
}

@end

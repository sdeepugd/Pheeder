//
//  FeedsTVC.h
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedsTVC : UITableViewController
@property (strong,nonatomic) NSURL* feedUrl;
@property (strong,nonatomic) Feed* feeds;
@end

NS_ASSUME_NONNULL_END

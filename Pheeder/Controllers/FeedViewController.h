//
//  FeedViewController.h
//  Pheeder
//
//  Created by Deepak S on 07/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "FeedItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface FeedViewController : UIViewController
@property (weak, nonatomic) IBOutlet WKWebView *feedTitleWebView;
@property (weak, nonatomic) IBOutlet WKWebView *feedWebView;
@property (strong,nonatomic) FeedItem* feed;
@end

NS_ASSUME_NONNULL_END

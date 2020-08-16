//
//  SubscribedFeedTableViewCell.h
//  Pheeder
//
//  Created by Deepu on 16/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubscribedFeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *subtitle;

@end

NS_ASSUME_NONNULL_END

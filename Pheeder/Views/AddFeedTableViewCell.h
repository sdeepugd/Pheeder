//
//  AddFeedTableViewCell.h
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddFeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *tick;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

NS_ASSUME_NONNULL_END

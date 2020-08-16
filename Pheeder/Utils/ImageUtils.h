//
//  ImageUtils.h
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtils : NSObject
+(UIImage*) getImageWithUrl:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END

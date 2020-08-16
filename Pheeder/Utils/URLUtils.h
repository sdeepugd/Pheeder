//
//  URLUtils.h
//  Pheeder
//
//  Created by Deepu on 08/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URLUtils : NSObject

+(NSData*)makeGetConnection:(NSURL*) urlStr;
+(NSURL*)geturlFromString:(NSString*) urlStr;
@end

NS_ASSUME_NONNULL_END

//
//  ImageUtils.m
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "ImageUtils.h"
#import "URLUtils.h"

@implementation ImageUtils
+(UIImage*) getImageWithUrl:(NSURL*)url
{
    NSData* imagedata = [URLUtils makeGetConnection:url];
    UIImage* image = [[UIImage alloc]initWithData:imagedata];
    return image;
}
@end

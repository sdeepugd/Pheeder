//
//  URLUtils.m
//  Pheeder
//
//  Created by Deepu on 08/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "URLUtils.h"

@implementation URLUtils

+(NSData*)makeGetConnection:(NSURL* ) urlStr
{
    NSData* data = [[NSData alloc] initWithContentsOfURL:urlStr];
    return data;
}

+(NSURL*)geturlFromString:(NSString*)urlStr
{
    NSURL* url = [[NSURL alloc]initWithString:urlStr];
    return url;
}

@end

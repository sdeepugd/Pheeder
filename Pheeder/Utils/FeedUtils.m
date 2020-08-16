//
//  FeedUtils.m
//  Pheeder
//
//  Created by Deepu on 08/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "FeedUtils.h"
#import "URLUtils.h"
#import "Feed.h"
#import "ImageUtils.h"

@implementation FeedUtils
NSString *const FeedlySearchURL = @"http://cloud.feedly.com/v3/search/feeds";
+(NSArray<Feed*>*) searchFeed:(NSString*) query
{
    NSData* feedData = [URLUtils makeGetConnection:[FeedUtils constructFeedlySearchURL:query]];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:feedData options:0 error:nil];
    return [FeedUtils parseFeedJsonResult:jsonObj];
}

+(NSURL*)constructFeedlySearchURL:(NSString*)query
{
    NSURLComponents* urlComponenent = [[NSURLComponents alloc] initWithString:FeedlySearchURL];
    NSMutableArray* queryItems = [[NSMutableArray alloc] init];
    
    NSURLQueryItem* queryQueryItem = [[NSURLQueryItem alloc] initWithName:@"query" value:query];
    [queryItems addObject:queryQueryItem];

    NSURLQueryItem* countQueryItem = [[NSURLQueryItem alloc] initWithName:@"count" value:@"20"];
    [queryItems addObject:countQueryItem];

    NSURLQueryItem* localeQueryItem = [[NSURLQueryItem alloc] initWithName:@"locale" value:@"en"];
    [queryItems addObject:localeQueryItem];
    
    [urlComponenent setQueryItems:queryItems];
    return [urlComponenent URL];
}
+(NSArray<Feed*>*) parseFeedJsonResult:(id)jsonObj
{
    NSMutableArray<Feed*>* feedArray = [[NSMutableArray alloc]init];
    
    if([jsonObj isKindOfClass:[NSDictionary class] ])
    {
        NSArray* results = jsonObj[@"results"];
        for (NSDictionary* feedJson in results)
        {
            Feed* resFeed = [[Feed alloc]init];
            [resFeed setTitle:feedJson[@"title"]];
            [resFeed setFeedID:feedJson[@"id"]];
            [resFeed setFeedDescription:feedJson[@"description"]];
            [resFeed setFeedURL:feedJson[@"website"]];
            NSString* iconUrlStr = feedJson[@"iconUrl"];
            if(iconUrlStr)
            {
                UIImage* image = [ImageUtils getImageWithUrl:[URLUtils geturlFromString:iconUrlStr]];
                [resFeed setBlogImage:image];
            }
            [feedArray addObject:resFeed];
        }
    }
    return feedArray;
}
@end

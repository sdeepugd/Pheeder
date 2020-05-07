//
//  RSSParser.h
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
NS_ASSUME_NONNULL_BEGIN

@interface RSSParser : NSObject <NSXMLParserDelegate>


@property (nonatomic,strong) NSXMLParser *xmlparser;
@property (nonatomic,strong) Feed* feed;
@property (nonatomic,strong) NSString* key;
@property (nonatomic,strong) NSString* value;
-(instancetype)initWithFeed:(Feed*)feed;
-(void)populateFeed;
@end

NS_ASSUME_NONNULL_END

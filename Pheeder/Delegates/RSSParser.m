//
//  RSSParser.m
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "RSSParser.h"
#import "FeedItem.h"


@interface RSSParser()

@property (strong,nonatomic) NSMutableArray* rssStack;
@property (strong,nonatomic) FeedItem *tempFeeditem;
@property (strong,nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation RSSParser
-(instancetype)initWithFeed:(Feed*)feed{
    if((self = [super init])){
        _feed = feed;
        _rssStack = [[NSMutableArray alloc]init];
        _xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:feed.feedURL];
        _dateFormatter = [[NSDateFormatter alloc]init];
        [_dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"]; // for date Mon, 27 Apr 2020 13:00:30 +0000
    }
    return self;
}
-(void)populateFeed
{
    [self.xmlparser setDelegate:self];
    [self.xmlparser parse];
    //    NSLog(@"Parsing status %@",success?@"true":@"false");
}
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    self.key=elementName;
    [self.rssStack addObject:elementName];
    if([elementName isEqualToString:@"item"]){
        if(_tempFeeditem){
            NSLog(@"adding feeds to feed list");
            [self.feed.feedItems addObject:_tempFeeditem];
        }
        _tempFeeditem = [[FeedItem alloc]init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)currText {
    self.value = currText;
}

- (void)parser:(NSXMLParser*) parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
//    NSString* poppedElem =  [self.rssStack lastObject];
    [self.rssStack removeLastObject];
    NSString* lastObj = self.rssStack.lastObject;
//    if([elementName isEqualToString:@"rss"]){
//
//    } else if([elementName isEqualToString:@"channel"]){
//
//    } else
    if([elementName isEqualToString:@"title"]){
        if([lastObj isEqualToString:@"channel"]){
            self.feed.title=self.value;
        }else if([lastObj isEqualToString:@"item"]){
            self.tempFeeditem.title = self.value;
        }
    } else if([elementName isEqualToString:@"link"]){
        if([lastObj isEqualToString:@"item"]){
            self.tempFeeditem.itemURL = [NSURL URLWithString:self.value];
        }
    } else if([elementName isEqualToString:@"pubDate"]){
        if([lastObj isEqualToString:@"item"]){
            self.tempFeeditem.publishedDate = [self.dateFormatter dateFromString:elementName ];
        }
    } else if([elementName isEqualToString:@"description"]){
        if([lastObj isEqualToString:@"item"]){
            self.tempFeeditem.breif = self.value;
        }
    } else if([elementName isEqualToString:@"content:encoded"]){
        if([lastObj isEqualToString:@"item"]){
            self.tempFeeditem.content = self.value;
        }
    } else if([elementName isEqualToString:@"channel"]){
        NSLog(@"adding feeds to feed list");
        [self.feed.feedItems addObject:_tempFeeditem];
    }
}

@end

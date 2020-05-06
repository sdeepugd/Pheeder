//
//  RSSParser.m
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "RSSParser.h"


@implementation RSSParser
-(instancetype)initWithFeed:(Feed*)feed{
    if((self = [super init])){
        _feed = feed;
        _xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:feed.feedURL];
    }
    return self;
}
-(void)populateFeed
{
    [self.xmlparser setDelegate:self];
    BOOL success = [self.xmlparser parse];
//    NSLog(@"Parsing status %@",success?@"true":@"false");
}
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"element name:%@",elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
 
    NSLog(@"Processing Value: %@", string);

}

- (void)parser:(NSXMLParser*) parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    NSLog(@"element name:%@",elementName);
}

@end

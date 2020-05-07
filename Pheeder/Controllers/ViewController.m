//
//  ViewController.m
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "ViewController.h"
#import "MainTBC.h"

@interface ViewController ()
@property (strong,nonatomic) NSURL* feedUrl;
@end

@implementation ViewController
- (IBAction)getFeedsButtonTapAction:(UIButton *)sender {
    NSString* feedurlText = [self.feedurlInput.text stringByTrimmingCharactersInSet:
                             [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(feedurlText){
        self.feedUrl = [NSURL URLWithString:feedurlText];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[MainTBC class]]){
        MainTBC* mainTBC =(MainTBC*)segue.destinationViewController;
        if([segue.identifier isEqualToString:@"FeedSegue"]){
            if(self.feedUrl){
                mainTBC.feedUrl =self.feedUrl;
            }
        } else if([segue.identifier isEqualToString:@"MSFeedSegue"]){
            mainTBC.feedUrl = [NSURL URLWithString:@"https://blogs.microsoft.com/feed/"];
        }
    }
}

@end

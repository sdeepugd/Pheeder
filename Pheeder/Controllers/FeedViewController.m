//
//  FeedViewController.m
//  Pheeder
// 
//  Created by Deepak S on 07/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    NSLog(@"in view did load");
    [super viewDidLoad];
    if(self.feed){
        NSLog(@"feed contents %@",self.feed.content);
        NSString* formattedTitle = [NSString stringWithFormat:@"<font face='GothamRounded-Bold' size='6'><b>%@</b></font>", self.feed.title];
        [self.feedTitleWebView loadHTMLString:formattedTitle baseURL:nil];
        NSString* formattedcontent = [NSString stringWithFormat:@"<font face='GothamRounded-Bold' size='4'>%@</font>", self.feed.content];
        [self.feedWebView loadHTMLString:formattedcontent baseURL:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

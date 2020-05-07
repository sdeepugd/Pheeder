//
//  FeedsTVC.m
//  Pheeder
//
//  Created by Deepak S on 06/05/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "FeedsTVC.h"
#import "Feed.h"
#import "RSSParser.h"
#import "MainTBC.h"
#import "FeedItem.h"

@interface FeedsTVC ()

@end

@implementation FeedsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[self parentViewController] isKindOfClass:[MainTBC class]]){
        MainTBC* parentView = (MainTBC*)[self parentViewController];
        self.feedUrl = parentView.feedUrl;
        NSLog(@"Url is Working.. %@",self.feedUrl);
        [self fetchFeeds];
    }
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)fetchFeeds{
    self.feeds = [[Feed alloc]initWithUrl:self.feedUrl];
    RSSParser *rssparser = [[RSSParser alloc]initWithFeed:self.feeds];
    [rssparser populateFeed];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"feed counts %lu",[self.feeds.feedItems count]);
    return [self.feeds.feedItems count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Feed Cell" forIndexPath:indexPath];
     FeedItem *feedItem = (FeedItem*)[self.feeds.feedItems objectAtIndex:indexPath.row];
     cell.textLabel.text = feedItem.title;
     cell.detailTextLabel.text = feedItem.breif;
 
 return cell;
 }
 
 
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

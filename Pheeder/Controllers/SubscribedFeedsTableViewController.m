//
//  SubscribedFeedsTableViewController.m
//  Pheeder
//
//  Created by Deepu on 16/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "SubscribedFeedsTableViewController.h"
#import "Feed.h"
#import "DBManager.h"
#import "SubscribedFeedTableViewCell.h"
@interface SubscribedFeedsTableViewController ()
@property (strong, nonatomic) NSMutableArray<Feed*> *feeds;
@property (strong, nonatomic) id<PersistenceImplementation> dbmanager;
@end

@implementation SubscribedFeedsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDbmanager:[DBManager getDefaultImplementation]];
    [self setFeeds:[[self dbmanager]getFeedSubscriptions]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self feeds]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = [indexPath row];
    Feed* feed = [[self feeds]objectAtIndex:row];
    SubscribedFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Subscribed Table View Cell" forIndexPath:indexPath];
    [[cell title]setText:[feed title]];
    [[cell subtitle]setText:[feed feedDescription]];
    [[cell image]setImage:[feed blogImage]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController* alertControler = [UIAlertController alertControllerWithTitle:@"Delete Feed Subcription!" message:@"Delete the feed subscription" preferredStyle:UIAlertControllerStyleAlert];
    void (^deleteHandler)(UIAlertAction *action) = ^(UIAlertAction* action){
        long row = [indexPath row];
        SubscribedFeedTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString* title = [[cell title]text];
        [[self dbmanager]deleteFeedSunscriptionWithTitle:title];
        [[self feeds]removeObjectAtIndex:row];
        [tableView reloadData];
    };
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:deleteHandler];
    [alertControler addAction:deleteAction];
    void (^dismissHandler) (UIAlertAction*) = ^(UIAlertAction* action){
        NSLog(@ "Dismiss Tapped");
    };
    UIAlertAction * dismissAction = [UIAlertAction actionWithTitle: @"Dismiss" style: UIAlertActionStyleDefault handler:dismissHandler];
    [alertControler addAction:dismissAction];
    [self presentViewController:alertControler animated:true completion:nil];
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

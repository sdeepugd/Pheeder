//
//  AddFeedViewController.m
//  Pheeder
//
//  Created by deepak on 13/07/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "AddFeedViewController.h"
#import "AddFeedTableViewCell.h"
#import "FeedUtils.h"
#import "AppDelegate.h"
#import <FMDB/FMDB.h>
#import "DBManager.h"

@interface AddFeedViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *addFeedTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Feed*> *feeds;
@property (strong,nonatomic) NSManagedObjectContext* context;
@end

@implementation AddFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    [[self tableView] setHidden:YES];
}

- (IBAction)tapOnSearch:(id)sender {
    NSString *searchString = [[self addFeedTextField] text];
    [self setFeeds:[FeedUtils searchFeed:searchString]];
}

- (void)setFeeds:(NSArray<Feed *> *)feeds
{
    _feeds = feeds;
    [[self tableView]reloadData];
    [[self tableView]setHidden:NO];
}

#pragma mark - TableView DataSource
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
    [[self view]endEditing:YES];
    long row = [indexPath row];
    Feed* feed = [[self feeds]objectAtIndex:row];
    AddFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Add Feed Table View Cell" forIndexPath:indexPath];
    [[cell title]setText:[feed title]];
    [[cell subtitle]setText:[feed feedDescription]];
    [[cell image]setImage:[feed blogImage]];
    [[cell tick]setHidden:YES];
    return cell;
}

//#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = [indexPath row];
    Feed* feed = [[self feeds]objectAtIndex:row];
    id<PersistenceImplementation> manager = [DBManager getDefaultImplementation];
    [manager addFeedSubscription:feed];
    AddFeedTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([[cell tick] isHidden])
    {[[cell tick] setHidden:NO];}
    else
    {[[cell tick] setHidden:YES];}
}
@end

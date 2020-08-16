//
//  DBManager.m
//  Pheeder
//
//  Created by Deepu on 09/08/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"

@interface DBManager()
{
  FMDatabase* fmdb ;
}
@end
@implementation DBManager
NSString* const DATABASE_NAME = @"pheeder.sqlite";

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL* baseURL = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:false error:nil];
        NSURL* dbURL = [baseURL URLByAppendingPathComponent:DATABASE_NAME];
        fmdb = [[FMDatabase alloc]initWithPath:[dbURL absoluteString]];
        [fmdb open];
        [self createDatabase];
    }
    return self;
}

+(id<PersistenceImplementation>)getDefaultImplementation
{
    return [[DBManager alloc]init];
}

- (void)createDatabase {
    NSString* createFeedSubscriptionStatement = @"CREATE TABLE if not exists PHEEDER_FEED_SUBSCRIPTION (ID integer,Title TEXT,Url TEXT,Feed_Description TEXT,Feed_ID TEXT,Image BLOB,PRIMARY KEY(ID AUTOINCREMENT))";
    [fmdb executeUpdate:createFeedSubscriptionStatement];
    NSString* createFeedItemStatement = @"CREATE TABLE if not exists PHEEDER_FEED_ITEM(ID integer , Title TEXT, Url TEXT , Date DATE, Content TEXT, Brief TEXT, IsBookmarked BOOLEAN, Subscription Integer,PRIMARY KEY(ID AUTOINCREMENT),FOREIGN KEY(Subscription) REFERENCES PHEEDER_FEED_SUBSCRIPTION(ID))";
    [fmdb executeUpdate:createFeedItemStatement];
}

-(NSMutableArray<Feed*>*)getFeedSubscriptions
{
    NSMutableArray<Feed*>* feedArray = [[NSMutableArray alloc]init];
    NSString* getSubscriptionWithURLQuery = @"select * from PHEEDER_FEED_SUBSCRIPTION";
    FMResultSet* result = [fmdb executeQuery:getSubscriptionWithURLQuery];
    while([result next])
    {
        Feed* feed = [[Feed alloc]init];
        [feed setTitle:[result stringForColumn:@"Title"]];
        [feed setFeedURL:[NSURL URLWithString:[result stringForColumn:@"Url"]]];
        [feed setFeedDescription:[result stringForColumn:@"Feed_Description"]];
        [feed setFeedID:[result stringForColumn:@"Feed_ID"]];
        [feed setBlogImage:[UIImage imageWithData:[result dataForColumn:@"Image"]]];
        [feedArray addObject:feed];
    }
    return feedArray;
}

- (void)addFeedSubscription:(nonnull Feed *)feed {
    NSString* insertFeedSubscriptionStatement = @"insert into PHEEDER_FEED_SUBSCRIPTION (Title ,Url ,Feed_Description ,Feed_ID ,Image ) values (?,?,?,?,?)";
    [fmdb executeUpdate:insertFeedSubscriptionStatement,[feed title],[feed feedURL],[feed feedDescription],[feed feedID],UIImagePNGRepresentation([feed blogImage])];
}

- (void)deleteFeedSunscriptionWithTitle:(NSString*)title
{
    NSString* deleteFeedScubscriptionStatement = @"delete from PHEEDER_FEED_SUBSCRIPTION where Title= ?";
    [fmdb executeUpdate:deleteFeedScubscriptionStatement,title];
}
     
@end

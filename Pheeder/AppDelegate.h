//
//  AppDelegate.h
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

